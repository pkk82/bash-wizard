#!/usr/bin/env bash

function printInfo() {
  printf "\e[1;36m%s\e[0m\n" "$1"
}

function printUpdateInfo() {
  printf "\e[1;32m%s\e[0m\n" "$1"
}

function printCommand() {
  printf "  %s\n" "$1"
}

function configDir() {
  echo "$HOME/.bash-wizard"
}

function selfDir() {
   scriptPath=$(realpath "$0")
   dirname "$scriptPath"
}

function verifyFile() {
  local file
  file=$1
  if [[ -f "$file" ]]; then
    echo "1"
  else
    echo "0"
  fi
}

function addFileLoadingByRcFiles() {
  local rcCandidates
  local rcExists
  local newRcFilePath
  rcCandidates=("$HOME/.bashrc" "$HOME/.zshrc")
  for candidate in "${rcCandidates[@]}"; do
    if [[ $(verifyFile "$candidate") == "1" ]]; then
      addFileLoadingByRcFile "$candidate" "$1"
      rcExists="1"
    fi
  done
  if [[ "$rcExists" != "1" ]]; then
    newRcFilePath="$HOME/.$(basename "$SHELL")rc"
    printInfo "No rc file found, creating $newRcFilePath"
    touch "$newRcFilePath"
    addFileLoadingByRcFile "$newRcFilePath" "$1"
  fi

}

function sedInFile() {
  local sedInplace
  local file
  local replacement
  replacement="$1"
  file="$2"
  if [[ $(uname) == "Darwin" ]]; then
    sedInplace="-i ''"
  else
    sedInplace="-i"
  fi
  sed $sedInplace "$replacement" "$file"
}

function addFileLoadingByRcFile() {
  local rcFile
  local loadedFile
  local rcFileExists
  rcFile="$1"
  loadedFile="$2"
  loadedFileName=${loadedFile//$HOME/}
  rcFileExists=$(verifyFile "$rcFile")
  if [[ "$rcFileExists" == "1" ]]; then
    if grep -q "$loadedFileName" "$rcFile"; then
      printInfo "$rcFile loads $loadedFile"
    else
      printUpdateInfo "modifying $rcFile to load $loadedFileName"
      {
        echo -e "\n### bash-wizard"
        echo -e "[[ -s \"\$HOME$loadedFileName\" ]] && . \"\$HOME$loadedFileName\"\n"
      } >>"$rcFile"
      sedInFile '/^$/N;/^\n$/D' "$rcFile"
    fi
  fi
}

function createMainRcFile() {
  path="$1"
  selfDir=$(selfDir)
  pathNoHome=${path//$HOME/}
  mainRcFile="$path/.bwrc"
  rm -rf "$mainRcFile"
  for f in "$selfDir"/.*rc; do
    fileName=$(basename "$f")
    echo ". \"\$HOME$pathNoHome/$fileName\"" >>"$mainRcFile"
  done
}

function createRcFiles() {
  selfDir=$(selfDir)
  for f in "$selfDir"/.*rc; do
    fileName=$(basename "$f")
    cat "$f" >"$1/$fileName"
  done
}

# create config directory
confDir=$(configDir)
rm -rf "$confDir"
mkdir -p "$confDir"

createMainRcFile "$confDir"
createRcFiles "$confDir"

# modify rc files to include bwrc
addFileLoadingByRcFiles "$confDir/.bwrc"

printInfo "bash-wizard is installed"
printInfo "To load the commands in your current session type:"
printCommand "source $mainRcFile"
printInfo "To see available commands:"
printCommand "bash-wizard"

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
  rcCandidates=("$HOME/.bashrc" "$HOME/.zshrc")
  for candidate in "${rcCandidates[@]}"; do
    if [[ $(verifyFile "$candidate") == "1" ]]; then
      addFileLoadingByRcFile "$candidate" "$1"
    fi
  done
}

function addFileLoadingByRcFile() {
  local rcFile
  local loadedFile
  local rcFileExists
  rcFile="$1"
  loadedFile="$2"
  rcFileExists=$(verifyFile "$rcFile")
  if [[ "$rcFileExists" == "1" ]]; then
    if grep -q "$loadedFile" "$rcFile"; then
      printInfo "$rcFile loads $loadedFile"
    else
      printUpdateInfo "modifying $rcFile to $loadedFile"
      echo "[[ -s \"$loadedFile\" ]] && . \"$loadedFile\"" >>"$rcFile"
    fi
  fi
}

function createMainRcFile() {
  mainRcFile="$1/.bwrc"
  rm -rf "$mainRcFile"
  for f in .*rc; do
    fileName=$(basename "$f")
    echo ". $1/$fileName" >> "$mainRcFile"
  done
}

function createRcFiles() {
  for f in .*rc; do
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



NC='\033[0m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'

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
      echo -e "${GREEN}$rcFile loads $loadedFile${NC}"
    else
      echo -e "${CYAN}modifying $rcFile to load $loadedFile${NC}"
      echo "[[ -s \"$loadedFile\" ]] && . \"$loadedFile\"" >>"$rcFile"
    fi
  fi
}

# create config directory
confDir=$(configDir)
rm -rf "$confDir"
mkdir -p "$confDir"

# create main rc file
cat >"$confDir/bwrc" <<EOL
. "$confDir/git"
. "$confDir/functions"
EOL

# create
. git.sh
. ./functions.sh

# modify rc files to include bwrc
addFileLoadingByRcFiles "$confDir/bwrc"


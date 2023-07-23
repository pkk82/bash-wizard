confDir=$(configDir)

functionsFile="$confDir/.functionsrc"

cat >"$functionsFile" <<EOL

function bash-wizard() {
  for f in "$confDir"/.*rc; do
    [[ -e "\$f" ]] || break
    fileName=\$(basename "\$f")
    [[ "\$fileName" != ".bwrc" ]] || continue
    [[ "\$fileName" != ".functionsrc" ]] || continue
    echo "\${fileName}" | sed 's/\.//g' | sed 's/rc//g' | tr '[:lower:]' '[:upper:]'
    grep "#" < "\$f"
    echo ""
  done
}

EOL



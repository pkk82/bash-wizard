confDir=$(configDir)

functionsFile="$confDir/functions"

cat >"$functionsFile" <<EOL

function bash-wizard() {
  for f in "$confDir"/*; do
    [[ -e "\$f" ]] || break
    fileName=\$(basename "\$f")
    [[ "\$fileName" != "bwrc" ]] || continue
    [[ "\$fileName" != "functions" ]] || continue
    echo "\${fileName}" | tr '[:lower:]' '[:upper:]'
    grep "#" < "\$f"
    echo ""
  done
}

EOL



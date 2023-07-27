confDir=$(configDir)
file="$confDir/.mavenrc"
cat >"$file" <<EOL
# mci - mvn clean install
alias mci='mvn clean install'

# mcv - mvn clean verify
alias mcv='mvn clean verify'

# mcp - mvn clean package
alias mcp='mvn clean package'

# mctc - mvn clean test-compile
alias mctc='mvn clean test-compile'

# mct - mvn clean test
alias mct='mvn clean test'

# mcist - mvn clean install -DskipTests
alias mcist='mvn clean install -DskipTests'

# mcpst - mvn clean package -DskipTests
alias mcpst='mvn clean package -DskipTests'

# mw - mvn wrapper:wrapper
alias mw='mvn wrapper:wrapper'

EOL

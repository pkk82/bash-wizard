confDir=$(configDir)
file="$confDir/.dockerrc"
cat ./.dockerrc >"$file"

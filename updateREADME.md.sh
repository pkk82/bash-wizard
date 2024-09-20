#!/bin/sh
unameKernelName=$(uname -s)
if [ "$unameKernelName" = "Darwin" ]; then
  sed -i '' "/## Aliases & Functions/,\$d" README.md
else
  sed -i "/## Aliases & Functions/,\$d" README.md
fi
echo "## Aliases & Functions" >> README.md
echo "" >> README.md
for f in ./.*rc; do
  [ -e "$f" ] || break
  fileName=$(basename "$f")
  [ "$fileName" != ".functionsrc" ] || continue
  echo "### ${fileName}" | sed 's/\.//g' | sed 's/rc//g' | tr '[:lower:]' '[:upper:]' >> README.md
  grep "^#" <"$f" | sed 's/#//g' | sed 's/\(.*\) - \(.*\)/    # \2\n   \1\n/g' >> README.md
done

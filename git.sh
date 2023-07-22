confDir=$(configDir)
file="$confDir/git"
cat >"$file" <<EOL
# gp - git pull
alias gp='git pull'

# gf - git fetch
alias gf='git fetch'

# gpo - git push origin
alias gpo='git push origin \$(git rev-parse --abbrev-ref HEAD 2>/dev/null)'

# gppo - git pull && git push origin <branch>
alias gppo='git pull && git push origin \$(git rev-parse --abbrev-ref HEAD)'

# gcb - git checkout -b <branch>
alias gcb='git checkout -b'

# gbv - git branch -v
alias gbv='git branch -v'

# gbd - git branch -D <branch>
alias gbd='git branch -D'

# gbm - git branch --merged
alias gbm='git branch --merged'

# gl1 - git log --oneline -n 1
alias gl1='git log --oneline -n 1'

# gl2 - git log --oneline -n 2
alias gl2='git log --oneline -n 2'

# gl3 - git log --oneline -n 3
alias gl3='git log --oneline -n 3'

# gl4 - git log --oneline -n 4
alias gl4='git log --oneline -n 4'

# gl5 - git log --oneline -n 5
alias gl5='git log --oneline -n 5'

# gl6 - git log --oneline -n 6
alias gl6='git log --oneline -n 6'

# gl7 - git log --oneline -n 7
alias gl7='git log --oneline -n 7'

# gl8 - git log --oneline -n 8
alias gl8='git log --oneline -n 8'

# gl9 - git log --oneline -n 9
alias gl9='git log --oneline -n 9'

# gcm - git checkout <main branch>
function gcm() {
  git checkout \$(git remote show origin 2>/dev/null | sed -n '/HEAD branch/s/.*: //p')
}

# grom - git rebase origin/<main-branch>
function grom() {
  git rebase origin/\$(git remote show origin 2>/dev/null | sed -n '/HEAD branch/s/.*: //p')
}

EOL


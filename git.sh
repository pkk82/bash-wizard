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

# grv - git remote -v
alias grv='git remote -v'

# gc - check if inside git repository, "1" inside, "0" outside
function gc() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "1"
  else
    echo "0"
  fi
}

# gb - display current branch
function gb() {
  git rev-parse --abbrev-ref HEAD
}

# gmb - display main branch
function gmb() {
  git remote show origin | sed -n '/HEAD branch/s/.*: //p'
}

# gcm - git checkout <main branch>
function gcm() {
  if [[ "\$(gc)" == "1" ]]; then
    git checkout "\$(gmb)"
  else
    echo "Not inside a git repository."
  fi
}

# grom - git rebase origin/<main-branch>
function grom() {
  if [[ "\$(gc)" == "1" ]]; then
    git rebase "origin/\$(gmb)"
  else
    echo "Not inside a git repository."
  fi
}

# gbdm - remove merged branches
function gbdm() {
  if [[ "\$(gc)" == "1" ]]; then
    b=\$(gb_)
    mb=\$(gmb_)
    confirm="y"

    if [[ "\$b" != "\$mb" ]]; then
      echo "You are not on the main branch."
      read -r -p "Do you want to continue? (y/n) " confirm
    fi

    if [[ "\$confirm" =~ ^[Yy]\$ ]]; then
      mergedBranches=\$(git branch --merged | grep -vE "(\*|\$mb)")
      if [[ "\$mergedBranches" == "" ]]; then
        echo "No branches to remove."
      else
        echo "\$mergedBranches" | xargs git branch -d
      fi
    fi
  else
    echo "Not inside a git repository."
  fi
}

EOL


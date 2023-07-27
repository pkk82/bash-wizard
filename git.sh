confDir=$(configDir)
file="$confDir/.gitrc"
cat >"$file" <<EOL
# gp - git pull
alias gp='git pull'

# gt <tag> - git tag <tag>
alias gt='git tag'

# gf - git fetch
alias gf='git fetch'

# gpo - git push origin <current branch>
alias gpo='git push origin \$(git rev-parse --abbrev-ref HEAD 2>/dev/null)'

# gpot - git push origin --tags
alias gpot='git push origin --tags'

# gppo - git pull && git push origin <current branch>
alias gppo='git pull && git push origin \$(git rev-parse --abbrev-ref HEAD)'

# gc <branch> - git checkout <branch>
alias gc='git checkout'

# gcb <branch> - git checkout -b <branch>
alias gcb='git checkout -b'

# gb - git branch
alias gb='git branch'

# gbv - git branch -v
alias gbv='git branch -v'

# gbd <branch> - git branch -D <branch>
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

# g-c - check if inside git repository, "1" inside, "0" outside
function g-c() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "1"
  else
    echo "0"
  fi
}

# g-cb - display current branch
function g-cb() {
  git rev-parse --abbrev-ref HEAD
}

# g-mb - display main branch
function g-mb() {
  git remote show origin | sed -n '/HEAD branch/s/.*: //p'
}

# gcm - git checkout <main branch>
function gcm() {
  if [[ "\$(g-c)" == "1" ]]; then
    git checkout "\$(g-mb)"
  else
    echo "Not inside a git repository."
  fi
}

# gcmp - git checkout <main branch> && git pull
function gcmp() {
  if [[ "\$(g-c)" == "1" ]]; then
      git checkout "\$(g-mb)"
      git pull
    else
      echo "Not inside a git repository."
    fi
}

# grom - git rebase origin/<main-branch>
function grom() {
  if [[ "\$(g-c)" == "1" ]]; then
    git rebase "origin/\$(g-mb)"
  else
    echo "Not inside a git repository."
  fi
}

# gbdm - remove merged branches
function gbdm() {
  if [[ "\$(g-c)" == "1" ]]; then
    b=\$(g-cb)
    mb=\$(g-mb)
    confirm="y"

    if [[ "\$b" != "\$mb" ]]; then
      echo "You are not on the main branch."
      echo -n "Do you want to continue? (y/n): "
      read -r confirm
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


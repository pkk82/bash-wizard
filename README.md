# BashWizard

BashWizard is a collection of bash scripts that aims to turn your shell environment into a powerhouse of productivity by setting up useful aliases and functions. 
With BashWizard, you can simplify complex tasks, save time, and make your command-line experience more enjoyable.


## Getting Started

Follow the steps below to set up `bash-wizard` in your shell environment:

1. Clone the repository to your local machine:
    ```bash 
    git clone https://github.com/pkk82/bash-wizard.git
    ```
2. Navigate to the bash-wizard directory:
    ```bash
    cd bash-wizard
    ```
3. Run the installation script:
    ```bash
    ./install.sh
    ```
    The installation script will automatically add the necessary entries to your **.bashrc** (or **.zshrc** for macOS) file to enable the aliases and functions in every new shell session.
4. Restart your terminal or run the following command to apply the changes to your current session
    ```bash
    source ~/.bashrc
    ```
5. Congratulations! You are now an BashWizard user. Explore the provided aliases and functions by typing `bash-wizard` in your terminal.

## Update README.md

To automatically update the README.md file with the latest aliases and functions, run the following script:

```bash
./updateREADME.md.sh
```

## Aliases & Functions

### BASHWIZARD
    # bash-wizard help
    bw

    # bash-wizard update
    bwu

### D2
    # d2 -w <file> -o /tmp/<file>.svg
    d2w

### DOCKERCOMPOSE
    # docker compose
    dc

    # docker compose up
    dcu

    # docker compose start
    dcstart

    # docker compose stop
    dcstop

    # docker compose up -d
    dcud

    # docker compose up -d --build
    dcudb

    # docker compose logs
    dcl

    # docker compose logs -f
    dclf

    # docker compose down
    dcd

    # docker compose down -v
    dcdv

    # docker compose restart
    dcr

    # docker compose down && docker compose up -d
    dcdud

    # docker compose down && docker compose up -d --build
    dcdudb

    # docker compose exec <service> /bin/bash
    dcbash <service>

    # docker compose exec <service> /bin/sh
    dcsh <service>

### DOCKER
    # docker
    d

    # docker stop all running containers
    dsa

    # docker remove all containers
    dra

    # docker exec -it <container> /bin/bash
    dbash <container>

    # docker exec -it <container> /bin/sh
    dsh <container>

### ENGLISH
    # download two mp3 files with British and American pronunciation for provided word
    english-download-mp3-pronunciation-from-google

### FIND
    # find files in given directory containing a term
    fgr <dir> <term>

    # display content of files with given name in given directory
    fca <dir> <filename>

    # find and remove directories with given name in given directory
    frmd <dir> <dir name>

    # find and remove files with given name in given directory
    frmf <dir> <file name>

### GIT
    # git pull
    gp

    # git pull --all
    gpall

    # git status
    gs

    # git tag <tag>
    gt <tag>

    # git tag --delete <tag>
    gtd <tag>

    # git fetch
    gf

    # git push origin <current branch>
    gpo

    # git push origin --all
    gpoall

    # git push origin HEAD~1:refs/heads/<current branch>
    gpo1

    # git push origin HEAD~2:refs/heads/<current branch>
    gpo2

    # git push origin HEAD~3:refs/heads/<current branch>
    gpo3

    # git push origin HEAD~4:refs/heads/<current branch>
    gpo4

    # git push origin HEAD~5:refs/heads/<current branch>
    gpo5

    # git push origin --tags
    gpot

    # git pull && git push origin <current branch>
    gppo

    # git push gh <current branch>
    gpgh

    # git push gh --all
    gpghall

    # git push gh --tags
    gpght

    # git push bb <current branch>
    gpbb

    # git push bb --all
    gpbball

    # git push bb --tags
    gpbbt

    # git checkout <branch>
    gc <branch>

    # git checkout -b <branch>
    gcb <branch>

    # git branch
    gb

    # git branch -v
    gbv

    # git branch -r
    gbr

    # git branch -r -v
    gbrv

    # git branch -D <branch>
    gbd <branch>

    # git branch --merged
    gbm

    # git branch --set-upstream-to=origin/<branch> <branch>
    gbsuto

    # git log --oneline -n 1
    gl1

    # git log --oneline -n 2
    gl2

    # git log --oneline -n 3
    gl3

    # git log --oneline -n 4
    gl4

    # git log --oneline -n 5
    gl5

    # git log --oneline -n 6
    gl6

    # git log --oneline -n 7
    gl7

    # git log --oneline -n 8
    gl8

    # git log --oneline -n 9
    gl9

    # git rebase -i HEAD~1
    gri1

    # git rebase -i HEAD~2
    gri2

    # git rebase -i HEAD~3
    gri3

    # git rebase -i HEAD~4
    gri4

    # git rebase -i HEAD~5
    gri5

    # git rebase -i HEAD~6
    gri6

    # git rebase -i HEAD~7
    gri7

    # git rebase -i HEAD~8
    gri8

    # git rebase -i HEAD~9
    gri9

    # git rebase --continue
    grc

    # git rebase --abort
    gra

    # git remote -v
    grv

    # check if inside git repository, "1" inside, "0" outside
    g-c

    # display current branch
    g-cb

    # display main branch
    g-mb

    # git checkout <main branch>
    gcm

    # git checkout <main branch> && git pull
    gcmp

    # git rebase origin/<main-branch>
    grom

    # git merge origin/<main-branch>
    gmom

    # remove merged branches
    gbdm

    # git reset --soft HEAD~1
    gsr1

    # git reset --soft HEAD~2
    gsr2

    # git reset --soft HEAD~3
    gsr3

    # git reset --soft HEAD~4
    gsr4

    # git reset --soft HEAD~5
    gsr5

    # git reset --soft HEAD~6
    gsr6

    # git reset --soft HEAD~7
    gsr7

    # git reset --soft HEAD~8
    gsr8

    # git reset --soft HEAD~9
    gsr9

    # git reset --hard HEAD~1
    ghr1

    # git reset --hard HEAD~2
    ghr2

    # git reset --hard HEAD~3
    ghr3

    # git reset --hard HEAD~4
    ghr4

    # git reset --hard HEAD~5
    ghr5

    # git reset --hard HEAD~6
    ghr6

    # git reset --hard HEAD~7
    ghr7

    # git reset --hard HEAD~8
    ghr8

    # git reset --hard HEAD~9
    ghr9

    # git stash -u
    gsu

    # git config --global core.pager cat
    gdp (git-disable-pager)

    # git config --global core.pager cat
    git-disable-pager

    # git config --global user.name <username> && git config --global user.email <email>
    git-set-global-committer <username> <email>

    # git config --global pull.rebase true'
    git-set-global-pull-rebase

### HTPASSWD
    # encrypt a string using BCrypt hashing for use in Spring applications
    htpasswd-hash-bcrypt-spring <string>

### INTELLIJ
    # launch IntelliJ IDEA with current directory as project
    ii

### JAVA
    # check if java class is main class
    jim <class file path>

    # encrypt a string using BCrypt hashing for use in Spring applications
    j-bcrypt-hash <string>

    # encrypt a string using SHA256 hashing for use in Spring applications (PKCE in OAuth)
    j-sha256-hash-url <string>

### KUBERNETES
    # kubectl
    k

### MACOS
    # replaces the right command key with right option key
    macos-replace-right-command-and-right-option

### MAVEN
    # mvn clean install
    mci

    # mvn clean verify
    mcv

    # mvn clean package
    mcp

    # mvn clean compile
    mcc

    # mvn clean test-compile
    mctc

    # mvn clean test
    mct

    # mvn clean install -DskipTests
    mcist

    # mvn clean package -DskipTests
    mcpst

    # mvn install
    mi

    # mvn verify
    mve

    # mvn package
    mp

    # mvn compile
    mc

    # mvn test-compile
    mtc

    # mvn test
    mt

    # mvn install -DskipTests
    mist

    # mvn package -DskipTests
    mpst

    # mvn wrapper:wrapper -Dmaven=<version>
    mw <version>

    # launch compiled class using maven exec plugin, pass term matching main class as first argument and arguments to main class as subsequent ones
    mej

    # launch all compiled class using maven exec plugin, pass term matching main class as first argument and arguments to main class as subsequent ones
    meja

    # launch all compiled class using maven exec plugin, pass arguments to main classes as subsequent ones
    mejaa

    # mvn versions:display-plugin-updates
    mvdpu

### OPENSSL
 openssl-generate-server-certificate-signed-by-ca <ca-cert> <ca-key> <subject> <alt-names>
 openssl-display-certificate <certificate>
### PNPM
    # npm install --location=global pnpm
    pnpm-install-via-npm

    # pnpm
    p

    # pnpm install
    pi

    # pnpm add <package>
    pa

### SVM
    # download soft-ver-man
    svmd


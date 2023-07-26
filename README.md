# BashWizard

BashWizard is a collection of bash scripts that aims to turn your shell environment into a powerhouse of productivity by setting up useful aliases and functions. 
With BashWizard, you can simplify complex tasks, save time, and make your command-line experience more enjoyable.


## Getting Started
Follow the steps below to set up AliasGenius in your shell environment:

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

## Aliases & Functions

### GIT 
    # git pull
    gp

    # git tag <tag>
    gt

    # git fetch
    gf

    # git push origin <branch>
    gpo

    # git push origin --tags
    gpot

    # git pull && git push origin <branch>
    gppo

    # git checkout <branch>
    gc

    # git checkout -b <branch>
    gcb

    # git branch
    gb

    # git branch -v
    gbv

    # git branch -D <branch>
    gbd

    # git branch --merged
    gbm

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

    # remove merged branches
    gbdm

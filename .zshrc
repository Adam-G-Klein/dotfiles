# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/agklein/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.bash_profile
source ~/.bashrc
alias gits="git status"
alias gitcam="git commit --amend"
alias gitcm="git commit -m"
alias gitc="git commit"
alias gita="git add"
alias gitpom="git push origin master"
alias gitpo="git push origin"
alias gitp="git push"
alias gitc="git commit"
alias gitl="git log"
alias gitlg="git log --oneline --decorate --color --graph"
alias gitrbi="git rebase -i"
alias gitrbc="git rebase --continue"
alias gitchb="git checkout -b"
alias gitch="git checkout"
alias gitchm="git checkout master"
alias lsalias="cat ~/.bash_profile"

alias platset="brazil ws use --platform AL2012"
alias cachereset="brazil-package-cache disable_edge_cache && brazil-package-cache enable_edge_cache && brazil-package-cache start"
alias credstunnel="ssh -f -N -L 2009:127.0.0.1:2009 agklein.aka.corp.amazon.com"
alias cacheclean-yes-im-sure="brazil-package-cache clean --days 0 --keepCacheHours 0"
alias nodeclean="rm -rf node_modules && bb clean && bb"
alias so="kinit -f && mwinit -o"
alias cb="cd /Volumes/workplace"

alias bb=brazil-build

export PATH="/apollo/env/SDETools/bin:$PATH"
export PATH="$HOME/.toolbox/bin:$PATH"
bindkey '^r' history-incremental-search-backward
export AWS_ACCESS_KEY_ID="omit"
export AWS_SECRET_ACCESS_KEY="omit"
function allSubDirs() {
    for d in ./*/ ; do /bin/zsh -c "(cd "$d" && "$@")"; done
}
infraUpdate(){
    echo "make sure ninja-dev-sync is running!"
    echo "infraUpdate: ws sync"
    brazil ws --sync -md 
    allSubDirs "git stash && git pull && rm -rf node_modules"
    echo "infraUpdate: pulling and building constructs"
    #cd ForgePrivacyServiceCDKConstructs && git stash && git pull && rm -rf node_modules 
    #echo "infraUpdate: pulling and building datasetlambda"
    #cd ../ForgePrivacyServiceDatasetLambda && git stash && git pull && rm -rf node_modules 
    #echo "infraUpdate: pulling and building CDK"
    #cd ../ForgePrivacyIPXInfraCDK && git stash && git pull && rm -rf node_modules 
    #cd ../ForgePrivacyIPXInfraCDK && git stash && git pull && rm -rf node_modules 
    echo "infraUpdate: replacing content of .env file with agklein"
    sed -i -e 's/srabara/agklein/g' .env
}  
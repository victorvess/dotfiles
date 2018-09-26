# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export LC_CTYPE="en_US.UTF-8"

export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

#GoLang path
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export GRADLE_HOME=$HOME/tools/gradle
export M2_HOME=$HOME/tools/maven
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:$JAVA_HOME/bin:$GRADLE_HOME/bin:$M2_HOME/bin

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
#shopt -s cdspell


# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done


###############################################################################
# COMPLETION
###############################################################################

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# SSH auto-completion based on entries in known_hosts.
if [[ -e ~/.ssh/known_hosts ]]; then
  complete -o default -W "$(cat ~/.ssh/known_hosts | sed 's/[, ].*//' | sort | uniq | grep -v '[0-9]')" ssh scp stfp
fi

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

###############################################################################
#RUBY
###############################################################################

# http://michaelahale.com/blog/2008/11/20/rubyopt-how-it-works/
export RUBYOPT="-r rubygems"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

###############################################################################
# NVM
###############################################################################

# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

###############################################################################
# APM
###############################################################################

# export ATOM_NODE_URL=http://gh-contractor-zcbenz.s3.amazonaws.com/atom-shell/dist

###############################################################################
# Kubernetes
###############################################################################
#alias kubens="kubectl config set-context $(kubectl config current-context) --namespace"

###############################################################################
# GCP
###############################################################################
#alias gconfig="gcloud config configurations"

###############################################################################
# PYTHON
###############################################################################
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv

source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.venv

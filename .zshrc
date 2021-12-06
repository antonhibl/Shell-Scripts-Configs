# export path with ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
# Set vim for command line use
set -o vi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# metasploit alias
alias metasploit="/opt/metasploit-framework/bin/msfconsole"

# command aliases
alias ls="ls -lsaG"
alias cp="cp -iv -a"
alias rm="rm -i"
alias mv="mv -v"
alias tree="tree -CA"
alias vi="vim"
alias ubu="multipass exec foo -- zsh"
alias ubucmd="multipass exec foo --"

# C Compilation Alias
alias compilate='gcc -Wall -Werror -Wextra -I /usr/local/include -L /usr/local/lib -lgsl -fpie -g3 -O0 --ansi -pedantic -lm'

# Helpful Network Programs
alias pyssh="python3 ~/l4p1s/other/pyth0n/ssh.py"
alias pycat="python3 ~/l4p1s/other/pyth0n/netcat.py"

#Change the umask to make directory sharing easier
umask 0002

# Search for dot files
alias l.="ls -d .*"
alias ll="ls -l"

# Ignore duplicates in cmd history & increase history size to 1000 lines
export HISTCONTROL=ignoredups
export HISTSIZE=1000

# Sets Prompt
PROMPT="%F{69}┌──%f%F{cyan}%t%F{69}[%f%F{11}%n%f%F{white}@%f%F{42}%1d%F{69}]%f%f"$'\n'"%F{69}└─%f %F{197}λ%f "

# Alias for monsoon ssh shell
alias monsoon='ssh -Y aeh436@monsoon.hpc.nau.edu'
alias ctags='/usr/bin/ctags'

# jupyter theme settings
#jt -t monokai -f sourcemed

# change to my code directory
cd ~/l4p1s
# echo hello message to me
echo "hello friend."
# use zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cthulhu/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cthulhu/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cthulhu/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cthulhu/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias metasploit="/opt/metasploit-framework/bin/msfconsole"

alias ls="ls -lsaG"
alias cp="cp -iv -a"
alias rm="rm -i"
alias mv="mv -v"
alias tree="tree -C -A"
alias vi="vim"


# Helpfulmovement shortcuts
alias schrodinger='cd ~/l4p1s/quantum; conda activate quantumlab'
alias snakey='cd ~/l4p1s/pyth0n'
alias gen0m1cs='cd ~/l4p1s/mung1ng/qiime; conda activate qiime2'
alias bi01nf0rm4t1cs='cd ~/l4p1s/mung1ng/qiime; conda activate qiime2-dev'
alias 3ll10t='cd ~/l4p1s/s3p10l'
alias websites='cd ~/l4p1s/webdev'
alias kernigan='cd ~/l4p1s/holyC'
alias c0ffee='cd ~/l4p1s/java'
alias scriptkid='cd ~/l4p1s/bash'
alias rustacean='cd ~/l4p1s/rust; rustup update'

# Helpful Network Programs
alias pyssh="python3 ~/l4p1s/s3p10l/ssh_cmd.py"
alias pycat="python3 ~/l4p1s/s3p10l/netcat.py"

#Change the umask to make directory sharing easier
umask 0002
# Search for dot files
alias l.="ls -d .*"
alias ll="ls -l"

# Ignore duplicates in cmd history & increase history size to 1000 lines
export HISTCONTROL=ignoredups
export HISTSIZE=1000

# Sets Prompt
PROMPT='%F{cyan}%t%F{69}[%f%F{11}%n%f%F{white}@%f%F{42}%1d%F{69}]%f%f$'

# Alias for monsoon
alias monsoon='ssh -Y aeh436@monsoon.hpc.nau.edu'

jt -t monokai -f sourcemed

cd ~/l4p1s
echo "hello friend."

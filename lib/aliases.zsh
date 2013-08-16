# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

MVIM=/Applications/MacVim.app/Contents/MacOS/Vim
[[ -x $MVIM ]] && alias vim=$MVIM

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
# Allow for aliases with sudo. http://www.zsh.org/mla/users/2008/msg01229.html
alias sudo='noglob do_sudo '
function do_sudo
{
    integer glob=1
    local -a run
    run=( command sudo )
    if [[ $# -gt 1 && $1 = -u ]]; then
        run+=($1 $2)
        shift ; shift
    fi
    (($# == 0)) && 1=/bin/zsh
    while (($#)); do
        case "$1" in
        command|exec|-) shift; break ;;
        nocorrect) shift ;;
        noglob) glob=0; shift ;;
        *) break ;;
        esac
    done
    if ((glob)); then
        PATH="/sbin:/usr/sbin:/usr/local/sbin:$PATH" $run $~==*
    else
        PATH="/sbin:/usr/sbin:/usr/local/sbin:$PATH" $run $==*
    fi
}

alias _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

alias afind='ack-grep -il'


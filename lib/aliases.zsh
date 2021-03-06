# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

MVIM=/Applications/MacVim.app/Contents/MacOS/Vim
[[ -x $MVIM ]] && alias vim=$MVIM

JULIA=/Applications/Julia-0.2.0.app/Contents/Resources/julia/bin/julia
[[ -x $JULIA ]] && alias julia=$JULIA

XPRA=/Applications/Window-Switch.app/Contents/Helpers/xpra
[[ -x $XPRA ]] && alias xpra=$XPRA

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
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up

alias afind='ack-grep -il'


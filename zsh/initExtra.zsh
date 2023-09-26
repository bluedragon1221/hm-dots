# Prompt always at bottom of screen
printf '\n%.0s' {1..100}
alias clear="clear; printf '\n%.0s' {1..100}"

# Execution Time
# Source: https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0
function preexec() {
    timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
    if [ $timer ]; then
	now=$(($(date +%s%0N)/1000000))
	elapsed=$(($now-$timer))

	RPROMPT="%F{cyan}${elapsed}ms%f"
	unset timer
    fi
}

autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

PROMPT='%F{red}${vcs_info_msg_0_}%f '    # Git Status
PROMPT+='%U%~%u '                        # Current Working Directory
PROMPT+='%B%(?.%F{green}.%F{red})λ%f%b ' # Prompt Character

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

source ~/.nix-profile/etc/profile.d/nix.sh

PATH+=":$HOME/.local/bin"
RUSTUP_HOME=$XDG_DATA_HOME/rustup
CARGO_HOME=$XDG_DATA_HOME/cargo

co() {
    cd ../$1
}

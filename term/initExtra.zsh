# Prompt always at bottom of screen
printf '\n%.0s' {1..100}
alias clear="clear; printf '\n%.0s' {1..100}"

source ~/.nix-profile/etc/profile.d/nix.sh

PATH+=":$HOME/.local/bin"
RUSTUP_HOME=$XDG_DATA_HOME/rustup
CARGO_HOME=$XDG_DATA_HOME/cargo

co() {
    cd ../$1
}

PROMPT="%U%~%u %B%(?.%F{green}.%F{red})λ%f%b "

source ~/.nix-profile/etc/profile.d/nix.sh

PATH+=":$HOME/.local/bin"
RUSTUP_HOME=$XDG_DATA_HOME/rustup
CARGO_HOME=$XDG_DATA_HOME/cargo

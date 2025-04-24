if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx LS_COLORS (vivid generate rose-pine | string replace -a "49;116;143" "156;207;216")


set -gx FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#101010,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#101010,hl+:#ebbcba
	--color=border:#403d52,header:#9ccfd8,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

set -gx TRIK_PYTHONPATH (python3.11 -c 'import sys; import os; print(os.pathsep.join(sys.path))')

set -gx EDITOR "nvim"
set -gx GRADLE_PATH "$HOME/thirdparty/gradle-8.11.1/bin/"
set -gx KOTLIN_PATH "$HOME/thirdparty/kotlinc/bin/"
set -gx KOTLIN_NATIVE_PATH "$HOME/thirdparty/kotlin-native-prebuilt-linux-x86_64-2.1.20/bin/"
set -gx GOPATH "$HOME/go/bin/"
set -gx GOPATH2 "$HOME/go/bin/bin/"
set -gx MIXPATH "$HOME/.mix/escripts/"

set -gx PATH "$PATH:$MIXPATH:$GOPATH:$GOPATH2:$KOTLIN_NATIVE_PATH:$KOTLIN_PATH:$GRADLE_PATH"
abbr -a lg lazygit
abbr -a vi nvim
abbr -a vim nvim
abbr -a ls "eza --icons=always --color=always"
abbr -a ll "eza -l --icons=always --color=always"
abbr -a l "eza -la --icons=always --color=always"

starship init fish | source
carapace _carapace fish | source
atuin init --disable-up-arrow fish | source

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/lev-arch/.local/share/coursier/bin:/app"
# <<< coursier install directory <<<

# pnpm
set -gx PNPM_HOME "/home/lev-arch/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

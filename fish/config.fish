if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx LS_COLORS (vivid generate rose-pine | string replace -a "49;116;143" "156;207;216")

set -gx TRIK_PYTHONPATH (python3.11 -c 'import sys; import os; print(os.pathsep.join(sys.path))')

set -gx EDITOR nvim
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

function ls --description 'List contents of directory'
    eza --icons=always --color=always $argv
end

function ll --wraps=ls --description 'List contents of directory using long format'
    eza -l --icons=always --color=always $argv
end

function la --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    eza -lA --icons=always --color=always $argv
end

# starship init fish | source
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

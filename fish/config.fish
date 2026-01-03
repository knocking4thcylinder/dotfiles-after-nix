if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind -M insert ctrl-p history-search-backward
bind -e -M insert up

bind -M insert ctrl-n history-search-forward
bind -e -M insert down

bind -M insert ctrl-y accept-autosuggestion and execute
bind -M insert ctrl-e accept-autosuggestion 

set -gx FZF_DEFAULT_OPTS "
--color=fg:#908caa,bg:#191724,hl:#ebbcba
--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
--color=border:#403d52,header:#9ccfd8,gutter:#191724
--color=spinner:#f6c177,info:#9ccfd8
--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

set -gx LS_COLORS (vivid generate rose-pine | string replace -a "49;116;143" "156;207;216")

# set -gx TRIK_PYTHONPATH (python3.11 -c 'import sys; import os; print(os.pathsep.join(sys.path))')

set -gx fish_greeting

set -gx EDITOR nvim
set -gx JAVA_HOME "/usr/lib/jvm/default-runtime/"
set -gx GRADLE_PATH "$HOME/thirdparty/gradle-8.11.1/bin/"
set -gx KOTLIN_PATH "$HOME/thirdparty/kotlinc/bin/"
set -gx KOTLIN_NATIVE_PATH "$HOME/thirdparty/kotlin-native-prebuilt-linux-x86_64-2.1.20/bin/"
set -gx DENOPATH "$HOME/.deno/bin/"
set -gx UVPATH "$HOME/.local/bin/"
set -gx GOPATH "$HOME/go/bin/"
set -gx GOPATH2 "$HOME/go/bin/bin/"
set -gx MIXPATH "$HOME/.mix/escripts/"

set -gx GOOGLE_CLOUD_PROJECT "DO_NOT_FORGET_TO_SETUP"

set -gx PATH "$JAVA_HOME/bin:$UVPATH:$DENOPATH:$MIXPATH:$GOPATH:$GOPATH2:$KOTLIN_NATIVE_PATH:$KOTLIN_PATH:$GRADLE_PATH:$PATH"
abbr -a lg lazygit
abbr -a vi nvim
abbr -a vim nvim

abbr -a gd "git diff"
abbr -a gs "git status --short"
abbr -a gc "git commit"
abbr -a gp "git push"
abbr -a gu "git pull"
abbr -a gl "git log --graph --all --pretty=format:'%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n'"
abbr -a gb "git branch"
abbr -a gi "git init"
abbr -a gcl "git clone"
abbr -a gco "git checkout"
abbr -a gap "git add --patch"

function pacman
    if [ "$argv[1]" = "-R" ]
        set argv[1] "-Rs"
    end
    command pacman $argv
end

function yay
    if [ "$argv[1]" = "-R" ]
        set argv[1] "-Rs"
    end
    command yay $argv
end

function ls --description 'List contents of directory'
    eza --icons=always --color=always $argv
end

function ll --wraps=ls --description 'List contents of directory using long format'
    eza -l --icons=always --color=always $argv
end

function l --wraps=ls --description 'List contents of directory, including hidden files in directory using long format'
    eza -lA --icons=always --color=always $argv
end

zoxide init fish --cmd cd | source
starship init fish | source
carapace _carapace fish | source
atuin init --disable-up-arrow fish | source
fish_config theme choose rose-pine

# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/k4c/.local/share/coursier/bin:/app"
# <<< coursier install directory <<<

# pnpm
set -gx PNPM_HOME "/home/k4c/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

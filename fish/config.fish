if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux LS_COLORS (vivid generate rose-pine)

set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#101010,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#101010,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

set -Ux TRIK_PYTHONPATH (python3.11 -c 'import sys; import os; print(os.pathsep.join(sys.path))')

alias lg="lazygit"
alias vi="nvim"
alias vim="nvim"
alias ls="eza --icons=always --color=always"
alias ll="eza -l --icons=always --color=always"
alias l="eza -la --icons=always --color=always"

starship init fish | source


# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/lev-arch/.local/share/coursier/bin"
# <<< coursier install directory <<<

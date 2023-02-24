if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias rmf="rm -rf"
alias nv="neovide"
alias help="less $HOME/.config/help"
alias neofetch="neofetch-legion"

# logo-ls alias
alias ls='logo-ls'
alias ill='logo-ls -al'
alias ila='logo-ls -A'


alias tor-browser='GTK_THEME="Mayu-Dark" tor-browser'


starship init fish | source

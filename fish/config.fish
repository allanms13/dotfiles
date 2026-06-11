# All User Configs goes here

starship init fish | source
alias ls='lsd'
alias ll='lsd -la'
alias cat='bat --paging=never'
alias tree='lsd --tree'

if status is-interactive
    ~/.local/lib/hyde/fastfetch.sh
end

zoxide init fish | source
fzf --fish | source

# opencode
fish_add_path /home/allanms/.opencode/bin

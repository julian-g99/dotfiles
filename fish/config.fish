set fish_greeting
base16-gruvbox-dark-medium
fish_vi_key_bindings

function fish_user_key_bindings
    fzf_key_bindings
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments


export DEFAULT_FZF_COMMAND='find .'
export FZF_ALT_C_COMMAND='find .'
export FZF_CTRL_T_COMMAND='find .'

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias v="nvim"
alias vim="nvim"
alias tm="tmux attach -t"
alias ls="lsd"
export TERM=termite

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/julian/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

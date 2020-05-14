set fish_greeting
base16-gruvbox-dark-medium

set -l color00 '#282828'
set -l color01 '#3c3836'
set -l color02 '#504945'
set -l color03 '#665c54'
set -l color04 '#bdae93'
set -l color05 '#d5c4a1'
set -l color06 '#ebdbb2'
set -l color07 '#fbf1c7'
set -l color08 '#fb4934'
set -l color09 '#fe8019'
set -l color0A '#fabd2f'
set -l color0B '#b8bb26'
set -l color0C '#8ec07c'
set -l color0D '#83a598'
set -l color0E '#d3869b'
set -l color0F '#d65d0e'

set -U FZF_DEFAULT_OPTS "
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

fish_vi_key_bindings

function fish_user_key_bindings
    fzf_key_bindings
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments


export DEFAULT_FZF_COMMAND='find .'
export FZF_ALT_C_COMMAND='find .'
export FZF_CTRL_T_COMMAND='find .'
export EDITOR='nvim'

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

alias v="nvim"
alias vim="nvim"
alias tm="tmux attach -t"
alias ls="lsd"
export TERM=termite

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/julian/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

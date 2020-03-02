set fish_greeting
#base16-gruvbox-dark-medium
base16-onedark

set -l color00 '#282c34'
set -l color01 '#353b45'
set -l color02 '#3e4451'
set -l color03 '#545862'
set -l color04 '#abb2bf'
set -l color05 '#abb2bf'
set -l color06 '#b6bdca'
set -l color07 '#c8ccd4'
set -l color08 '#e06c75'
set -l color09 '#d19a66'
set -l color0A '#e5c07b'
set -l color0B '#98c379'
set -l color0C '#56b6c2'
set -l color0D '#61afef'
set -l color0E '#c678dd'
set -l color0F '#be5046'

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

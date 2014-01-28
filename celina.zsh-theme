local sep="%{$fg[black]%}:%{$reset_color%}"
local user_host="%{$fg_bold[white]%}%m%{$reset_color%}${sep}"
local current_dir="%{$fg_bold[white]%}%c%{$reset_color%}${sep}"
local start="%{$fg[black]%}# %{$reset_color%}"

function __git_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

#PROMPT='%{$fg[red]%}%m%{$reset_color%}:%{$fg[cyan]%}%c%{$reset_color%}:%# '
PROMPT="${user_host}${current_dir} ${start}"
RPROMPT='%{$fg[black]%}$(__git_info)%{$reset_color%}% '

ZSH_THEME_GIT_PROMPT_PREFIX="<%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} •%{$reset_color%}%{$fg[black]%}>"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}%{$fg[black]%}>%{$reset_color%}"

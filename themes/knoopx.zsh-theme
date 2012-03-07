

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

branch_color ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          color=""
          if git diff --quiet 2>/dev/null >&2
          then
                  color="${c_green}"
          else
                  color=${c_red}
          fi
  else
          return 0
  fi
  echo -ne $color
}



PROMPT='%{$fg[grey]%} %{$fg[yellow]%}%~%{$reset_color%}%{$(branch_color)%}$(__git_ps1)%{$reset_color%} %{$fg[blue]%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "

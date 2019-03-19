_todo() {
  local iter use cur
  TODO="${TODO:-${HOME}/todo.txt}"
  if printf "%s" "$TERM" | grep -Fq screen && test "$TMUX" ; then
    sessname=$(tmux display -p '#S')
    if printf "%s" "$sessname" | grep -Eq '^[+-]?[0-9]+$'; then
      TODOFILE=$TODO
    else
      todopath=$(dirname "$TODO")
      TODOFILE=$todopath/$sessname".txt"
    fi
  else
    TODOFILE=$TODO
  fi
  cur=${COMP_WORDS[COMP_CWORD]}
  use=$( awk '{gsub(/ /,"\\ ")}8' "$TODOFILE" )
  use="${use//\\ /___}"
  for iter in $use; do
    if [[ $iter =~ ^$cur ]]; then
      COMPREPLY+=( "${iter//___/ }" )
    fi
  done
}

# Detect if current shell is ZSH, and if so, load this file in bash
# compatibility mode.
if [ -n "$ZSH_VERSION" ]; then
  autoload bashcompinit
  bashcompinit
fi

complete -o default -o nospace -F _todo todo

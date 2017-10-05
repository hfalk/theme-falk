function tbytes -d 'Calculates the total size of the files in the current directory'
  set -l tBytes (ls -al | grep "^-" | awk 'BEGIN {i=0} { i += $5 } END { print i }')

  if test $tBytes -lt 1048576
    set -g total (echo -e "scale=3 \n$tBytes/1048 \nquit" | bc)
    set -g units " Kb"
  else
    set -g total (echo -e "scale=3 \n$tBytes/1048576 \nquit" | bc)
    set -g units " Mb"
  end
  echo -n "$total$units"
end

function fish_right_prompt
  set_color blue
  printf '%s' (tbytes)
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
  date "+%H:%M:%S"
  set_color normal
end

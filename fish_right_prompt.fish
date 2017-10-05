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

function fish_right_prompt -d "Write out the right prompt"
  #set_color blue
  #printf '%s' (tbytes)
  # Timestamp
  set_color yellow
  printf '%s' (date)
end

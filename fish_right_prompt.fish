function fish_right_prompt
  #set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
  #date "+%H:%M:%S"
  printf (dim)(date +%H(fst):(dim)%M(fst):(dim)%S)(off)" "
  set_color normal
end

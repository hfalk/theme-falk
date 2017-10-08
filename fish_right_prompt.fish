function fish_right_prompt
  set_color $fish_color_autosuggestion ^/dev/null; or set_color 555
  printf '[%s]' (date "+%H:%M:%S")
  set_color normal
end

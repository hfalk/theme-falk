# Print current user
function prompt_get_user -d "Print the user"
  if test $USER = 'root'
    set_color red
  else
    set_color cyan
  end
  printf '%s' (whoami)
end

# Get Machines Hostname
function prompt_get_host -d "Get Hostname"
  if test $SSH_TTY
    tput bold
    set_color red
  else
    set_color yellow
  end
  printf '%s' (hostname|cut -d . -f 1)
end

# Get Project Working Directory
function prompt_get_pwd -d "Get PWD"
  set_color red
  printf '%s ' (prompt_pwd)
end

# Set GIT prompt
function prompt_git -d "Get GIT status"
  # For more info, see: https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
        set -g __fish_prompt_char \u276f\u276f
      case '*'
        set -g __fish_prompt_char »
    end
  end

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_git_prompt_showcolorhints true

  printf '%s'(__fish_git_prompt)
end

function fish_prompt
  set -l code $status

  # Logged in user
  prompt_get_user
  set_color normal
  printf ' at '

  # Machine logged in to
  prompt_get_host
  set_color normal
  printf ' in '

  # Path
  prompt_get_pwd
  set_color normal

  # Git info
  prompt_git

  # Line 2
  echo
  if test $VIRTUAL_ENV
    printf "(python:%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end

  if test $code -eq 127
    set_color red
  end

  printf '↪ '
  set_color normal
end

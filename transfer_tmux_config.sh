#!/bin/bash
main() {
  cp tmux-config.conf ~/.tmux.conf 
  if [[ "$?" == "0" ]]; then 
    echo "(1) ✅ tmux config was copied to official tmux config successfully"
  else
    echo "(1) ❌ tmux config did not copy successfully. Quitting now"
    return 1
  fi

  read -n1 -p "(2) ✅ tmux is ready to start! Start session? " confirmation
  echo
  if [[ $confirmation == 'y' ]]; then
    echo "(3) Starting tmux session now..." && tmux
  fi
}

main

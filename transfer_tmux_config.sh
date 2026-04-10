#!/bin/bash
main() {
  cp tmux-config.conf ~/.tmux.conf 
  if [[ "$?" == "0" ]]; then 
    echo "(1) ✅ tmux config was copied to official tmux config successfully"
  else
    echo "(1) ❌ tmux config did not copy successfully. Quitting now"
    return 1
  fi

  tmux source ~/.tmux.conf
  if [[ "$?" == "0" ]]; then 
    echo "(2) ✅ tmux config file was sourced successfully"
  else
    echo "(2) ❌ tmux config file was NOT sourced successfully. Quitting now"
    return 1
  fi
  
  read -n1 -p "(3) ✅ tmux is ready to start! Start session? " confirmation
  echo
  if [[ $confirmation == 'y' ]]; then
    echo "(4) Starting tmux session now..." && tmux
  fi
}

main

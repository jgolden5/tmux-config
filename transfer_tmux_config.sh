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
  if [[ "$?" == 0 ]]; then
    read -n1 -p "(2) ✅ tmux sourced successfully and is ready to start! Start session? " confirmation
  else
    echo "(2) ❌ tmux did not source successfully. Quitting now"
  fi
  echo
  if [[ $confirmation == 'y' ]]; then
    echo "(3) Starting tmux session now..." && tmux
  fi
}

main

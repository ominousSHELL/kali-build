#!/bin/zsh


TOKEN="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"

cd /root/kali-build/
echo "Copying configuration files..."
cp /etc/tmux.conf /root/kali-build/roles/configurations/tmux/files/tmux.conf
cp /etc/tmux.conf /root/kali-build/roles/configurations/zsh/files/.zshrc

#!/bin/bash

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# Install basic utilities
sudo apt install -y curl wget git vim unzip build-essential gdb

# Install Python and Ruby
sudo apt install -y python3 python3-pip python3-dev ruby libssl-dev libffi-dev

# Install pwntools, ROPGadget, one_gadget
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools
python3 -m pip install ROPGadget
sudo gem install one_gadget

# Install GEF for GDB
sh -c "$(curl -fsSL https://gef.blah.cat/sh)"

# Install angelheap
git clone https://github.com/scwuaptx/Pwngdb.git ~/.Pwngdb

# Configure angelheap in .gdbinit
cat <<EOF >> ~/.gdbinit

# Load angelheap
source ~/.Pwngdb/angelheap/gdbinit.py

define hook-run
python
import angelheap
angelheap.init_angelheap()
end
end
EOF

# Install Docker dependencies
sudo apt install -y ca-certificates gnupg lsb-release

# Add Docker GPG key and repository
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add current user to docker group
sudo usermod -aG docker "$USER"

# Add ~/.local/bin to PATH
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
export PATH="$HOME/.local/bin:$PATH"

# Final message
echo
echo "[+] Setup complete!"

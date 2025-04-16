# Linux-Setup

## ⚙️ Usage

To get started, first install and set up **Zsh** (required for running the setup script):

```bash
sudo apt install -y zsh
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
zsh
```

> 🔁 After installation, **log out and log back in** for zsh to be your default shell.

Then, clone this repository and run the setup script with Zsh:

```bash
git clone https://github.com/chocovy/Linux-Setup.git
cd Linux-Setup
zsh setup.sh
```


## 🖥️ Environment

- WSL 2 (Ubuntu)
- Ubuntu 22.04 LTS

## 📦 Features

- **GEF / angelheap** – GDB Enhanced Features for binary debugging  
- **pwntools** – Python-based exploit development library  
- **ROPGadget** – Tool for finding ROP gadgets in binaries  
- **one_gadget** – Tool to find one-shot RCE gadgets in libc  
- **Docker CE & Compose** – For containerized exploit/testing environments  


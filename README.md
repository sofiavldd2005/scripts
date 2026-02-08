# Utility Scripts Repository

A collection of my personal shell scripts to automate debugging and facilitate hardware interface with Wine. 

## 📂 Script Overview

| Script | Description |
| :--- | :--- |
| `radio_debugg.sh` | Streamlines the debugging process for radio/RF modules. |
| `stm_debugg.sh` | Helper script for STM32 microcontroller debugging and flashing. |
| `remap_tty_to_com.sh` | Automatically remaps TTY devices to COM ports for easier serial communication. |
| `start_kicad.sh` | Custom launcher for KiCad with predefined environment variables or project paths. |

## Installation & Usage

### 1. Clone the repository
```bash
git clone [https://github.com/sofiavldd2005/scripts.git](https://github.com/sofiavldd2005/scripts.git) ~/scripts
cd ~/scripts
```

Then to give execution permissions
```bash
chmod +x *.sh
```

Also, for me its nice the debugging script for the stm starts from anywhere, so I add to the shell config (for me is .zshrc)
```bash
export PATH="$HOME/scripts:$PATH"
```

# tmux-live

[![Linux](https://img.shields.io/badge/Linux-%23.svg?logo=linux&color=FCC624&logoColor=black)](#)
[![tmux](https://img.shields.io/badge/tmux-1BB91F?logo=tmux&logoColor=fff)](#)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnubash&logoColor=fff)](#)

A Bash script that creates a new tmux session and starts a live server in the selected directory. Perfect for web development workflows.

<!-- vim-markdown-toc GFM -->

* [Features](#features)
* [Prerequisites](#prerequisites)
* [Installation](#installation)
* [Tmux Key Binding Setup](#tmux-key-binding-setup)
* [Usage](#usage)
* [How It Works](#how-it-works)
* [Configuration](#configuration)
* [Credits](#credits)

<!-- vim-markdown-toc -->

## Features

- Creates a new tmux session with live-server running
- Interactive directory selection with fzf
- Supports custom ports
- Automatically opens the server in your default browser
- Can be triggered with tmux key binding

## Prerequisites

Make sure you have the following installed:

- tmux
- live-server (npm package)
- fzf
- xdg-utils (for `xdg-open` command)

## Installation

1. Clone this repository or download/copy the script
2. Make the script executable:

```bash
chmod +x tmux-live.sh
```

3. Move the script to your preferred location, for example:

```bash
mv tmux-live.sh ~/.local/scripts/tmux-live.sh
```

## Tmux Key Binding Setup

Add this line to your `~/.tmux.conf` (replace `ä` with desired keybind):

```bash
bind-key ä run-shell "~/path/to/script"
```

After adding the line:

1. Either restart tmux
2. Or reload the configuration by pressing `prefix + r`

## Usage

There are several ways to use the script:

1. Using tmux key binding:

   - Press `prefix + ä` (default tmux prefix is ctrl+b)
   - Select directory from the fzf popup
   - Server starts on default port 5050

2. Default mode - opens fzf directory picker and uses port 5050:

```bash
./tmux-live.sh
```

3. Custom port mode - specify port first, then select directory with fzf:

```bash
./tmux-live.sh 3000
```

4. Direct path mode - specify directory path and use default port 5050:

```bash
./tmux-live.sh /path/to/directory
```

## How It Works

1. When executed, the script either:
   - Shows an fzf popup to select a directory from predefined paths (~/school, ~/github_repositories, ~/projects)
   - Uses the provided directory path
2. Creates a new tmux session with the directory name
3. Starts live-server in the session on the specified port (default: 5050)
4. Opens your default browser to the live-server URL
5. Attaches to or switches to the new tmux session

## Configuration

The script looks for directories in these paths by default:

- `~/school`
- `~/github_repositories`
- `~/projects`

To change these paths, modify the `find` command in the script.

```bash
selected="$(find ~/school ~/github_repositories/ ~/projects -mindepth 1 -maxdepth 1 -type d | fzf-tmux -p 50% --header='Open live server:')"
```

## Credits

This script is heavily influenced by tmux-sessionizer, a script by [ThePrimeagen](https://github.com/ThePrimeagen/). The project adapts his session management approach while adding live-server functionality for web development.

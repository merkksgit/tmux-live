# tmux-live

A Bash script that creates a new tmux session and starts a live server in the selected directory. Perfect for web development workflows.

## Features

- Creates a new tmux session with live-server running
- Interactive directory selection with fzf
- Supports custom ports
- Automatically opens the server in your default browser
- Clean, single-window tmux session management
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

### Tmux Key Binding Setup

Add this line to your `~/.tmux.conf`:

```bash
bind-key l run-shell "~/path/to/script"
```

After adding the line:

1. Either restart tmux
2. Or reload the configuration by pressing `prefix + r`

## Usage

There are several ways to use the script:

1. Using tmux key binding:

   - Press `prefix + l` (default tmux prefix is ctrl+b)
   - Select directory from the fzf popup
   - Server starts on default port 5050

2. Default mode - opens fzf directory picker and uses port 5050:

```bash
tmux-live.sh
```

3. Custom port mode - specify port first, then select directory with fzf:

```bash
tmux-live.sh 3000
```

4. Direct path mode - specify directory path and use default port 5050:

```bash
tmux-live.sh /path/to/directory
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

## License

This project is licensed under the [MIT License](https://mit-license.org/)


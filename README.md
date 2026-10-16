# dotfiles

Shell, editor and terminal multiplexer settings for zsh, vim and tmux. They were written for macOS with Homebrew and also work on Linux with small path changes (see [Platform notes](#platform-notes)).

These files accompany the iServeData articles [Vim as an IDE for Python3, Part I](https://iservedata.com/vim-ide-python3-part1/) and [Part II](https://iservedata.com/vim-ide-python3-part2/).

## Contents

| File | Used by | What it sets up |
| --- | --- | --- |
| [`.zshrc`](.zshrc) | zsh | Two-line red prompt, emacs key bindings, fzf, history rules, colored output |
| [`.vimrc`](.vimrc) | vim | Editing defaults, persistent undo, vim-plug plugins, key mappings, red cursor line, log highlighting |
| [`.tmux.conf`](.tmux.conf) | tmux | Gold status bar with time and date, red accents, easier split keys, emacs key mode |

### .zshrc

- **Prompt:** A two-line red prompt that shows `user@host` and the full working directory:
  ```
  ┌──(user@host)-[/current/path]
  └─%
  ```
- **Environment:** `EDITOR` points to the Homebrew vim, Homebrew Ruby is added to `PATH`, and `TERM` is `tmux-256color`.
- **Keys:** emacs-style line editing (`bindkey -e`).
- **fzf:** Loads fzf key bindings and completion with `source <(fzf --zsh)`. `Ctrl-R` searches history, `Ctrl-T` finds files and `Alt-C` changes directory.
- **History:** Saved to `~/.zsh_history` (1,000 lines in memory, 2,000 on disk). Duplicates are dropped first, commands that start with a space are not saved, and history expansions are shown before they run. `history` lists the full history.
- **Colors:** On Linux, where `/usr/bin/dircolors` exists, `ls`, `grep`, `diff` and `ip` use color, man pages get colored bold and underline, and tab completion uses `LS_COLORS`.

### .vimrc

- **Editing:** Line numbers with relative numbering, a highlighted cursor line, 4-space indentation with spaces instead of tabs, smart indent, no line wrapping, indent-based folding (opened by default), smart-case search and a column marker at 238.
- **Files:** No backup or swap files. Undo history is kept between sessions in `~/.vim/undodir`.
- **Plugins** (managed with [vim-plug](https://github.com/junegunn/vim-plug)):
  - [lightline.vim](https://github.com/itchyny/lightline.vim): status line, `ayu_light` theme
  - [undotree](https://github.com/mbbill/undotree): visual undo history
  - [vim-polyglot](https://github.com/sheerun/vim-polyglot): syntax support for many languages
  - [auto-pairs](https://github.com/jiangmiao/auto-pairs): closes brackets and quotes as you type
  - fzf.vim, NERDTree, vim-pythonsense and ALE are listed but commented out. Remove the leading `"` to turn one on, then run `:PlugInstall`.
- **Key mappings** (leader is `Space`):

  | Keys | Action |
  | --- | --- |
  | `Ctrl-H` `Ctrl-J` `Ctrl-K` `Ctrl-L` | Move to the split on the left, below, above or right |
  | `Space q` | Open the quickfix list (25 lines) |
  | `Space c` | Close the quickfix list |
  | `Space t` | Open a terminal inside vim |
  | `Space u` | Toggle undotree |

- **Colors:** Red and black line numbers and cursor line, red search highlight. The netrw file browser opens in a split 25% wide.
- **Log highlighting:** Lines that contain `[DEBUG]`, `[ERROR]`, `[WARN]`, ` - VULNERABLE`, `OPEN`, `Errno` and a few scanner messages are colored so they stand out when reading logs and scan output. These rules apply to the first file vim opens. Run `:source ~/.vimrc` to apply them in another buffer.

### .tmux.conf

- **Status bar:** Gold (`#CFB53B`) with the time and date on the right (`HH:MM YYYY.MM.DD`).
- **Accents:** Red message bar and a red border on the active pane.
- **Splits:** `prefix |` splits side by side and `prefix _` splits top and bottom. Both open in the current directory. The default `"` and `%` split keys are removed.
- **Windows:** Names are not renamed automatically.
- **Keys:** emacs keys in copy mode and the command prompt.

The prefix is the tmux default, `Ctrl-B`.

## Requirements

- zsh, vim 8 or newer, tmux 3 or newer and git
- [fzf](https://github.com/junegunn/fzf) 0.48 or newer (needed for `fzf --zsh`)
- [vim-plug](https://github.com/junegunn/vim-plug) for the vim plugins

On macOS with Homebrew:

```bash
brew install vim tmux fzf git
```

On Ubuntu or Debian:

```bash
sudo apt install zsh vim tmux fzf git
```

If your distribution's fzf is older than 0.48, install it from the [fzf releases](https://github.com/junegunn/fzf/releases) instead.

## Deploy

The steps below link each file from the repository into your home folder, so `git pull` keeps them up to date. Any existing file is backed up first.

1. Clone the repository:

   ```bash
   git clone https://github.com/iServeData/dotfiles.git ~/dotfiles
   ```

2. Back up your current files and link the new ones:

   ```bash
   cd ~/dotfiles
   stamp="$(date +%Y%m%d_%H%M%S)"
   for f in .zshrc .vimrc .tmux.conf; do
     if [ -e "$HOME/$f" ] && [ ! -L "$HOME/$f" ]; then
       mv "$HOME/$f" "$HOME/${f}.bak_$stamp"
       echo "Backed up ~/$f to ~/${f}.bak_$stamp"
     fi
     ln -sfn "$HOME/dotfiles/$f" "$HOME/$f"
     echo "Linked ~/$f"
   done
   ```

3. Create the vim undo folder and install vim-plug and the plugins:

   ```bash
   mkdir -p ~/.vim/undodir
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   vim +PlugInstall +qall
   ```

4. Load the new settings:

   ```bash
   exec zsh                          # restart the current shell
   tmux source-file ~/.tmux.conf     # only if tmux is already running
   ```

To copy the files instead of linking them, replace `ln -sfn` with `cp` in step 2. Copied files don't update when you run `git pull`.

## Update

```bash
cd ~/dotfiles && git pull --ff-only
exec zsh
```

After plugin changes in `.vimrc`, run `vim +PlugInstall +PlugClean +qall`.

## Remove

Delete the links and restore your backups. Replace `<stamp>` with the date in the backup filename:

```bash
for f in .zshrc .vimrc .tmux.conf; do
  [ -L "$HOME/$f" ] && rm "$HOME/$f"
  [ -e "$HOME/${f}.bak_<stamp>" ] && mv "$HOME/${f}.bak_<stamp>" "$HOME/$f"
done
```

## Platform notes

Some paths assume Homebrew on an Intel Mac (`/usr/local`). Adjust these lines for other systems:

| Setting | File | Intel Mac (as written) | Apple Silicon Mac | Linux |
| --- | --- | --- | --- | --- |
| `EDITOR` | `.zshrc` | `/usr/local/Cellar/vim/*/bin/vim` | `/opt/homebrew/bin/vim` | `/usr/bin/vim` |
| Ruby on `PATH` | `.zshrc` | `/usr/local/opt/ruby/bin` | `/opt/homebrew/opt/ruby/bin` | Remove the line, or point it to your Ruby |
| fzf runtime path | `.vimrc` | `/usr/local/opt/fzf` | `/opt/homebrew/opt/fzf` | `/usr/share/doc/fzf/examples` (Debian and Ubuntu) |

- **`TERM`:** `.zshrc` sets `TERM=tmux-256color` for every shell. If programs outside tmux complain about an unknown terminal, move that line into a check such as `[ -n "$TMUX" ] && export TERM=tmux-256color`.
- **Colors on macOS:** The color aliases, colored man pages and completion colors only turn on when `/usr/bin/dircolors` exists, so they stay off on macOS. The rest of `.zshrc` works the same.


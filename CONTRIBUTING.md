# Contributing

Thanks for helping. These are zsh, vim and tmux settings; the README explains each file.

## Get it running

Clone the repository (the **Code** button on GitHub), then from its folder:

Copy or link the files you want into your home directory, as described in [README.md](README.md).
Try changes in a throwaway shell (`zsh -f`, `vim -u .vimrc`, `tmux -f .tmux.conf`) before replacing
your own settings.

## Making a change

- Branch from `prototype` and open the pull request against `prototype`; `main` is what gets installed.
- Never commit real tokens, passwords, keys, IP addresses, Discord IDs, domains, or community, guild,
  channel, server or player names. Use placeholders such as `Example Community`,
  `community.example.org`, `203.0.113.10` and `000000000000000000`.
- Keep host-specific paths, hostnames and user names out of the files; note them in the README instead.
- Lowercase filenames with underscores, no spaces.
- Add a line to `CHANGELOG.md` describing the change.

## Security problems

Please don't open a public issue; see [SECURITY.md](SECURITY.md).

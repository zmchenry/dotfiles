# Zach's Dot Files

## install

Run this:

```sh
git clone https://github.intuit.com/zmchenry/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

### qbo

I have a qbo topic to handle some QBO specific aliases, logic and variables. Please adjust as needed.

## what's inside

A lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.intuit.com/kbrown12/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## notable differences from holmans
1. Added a QBO topic
2. Added [Antigen](https://github.com/zsh-users/antigen) support. See the .zshrc file for current uses.
3. Removed various topics (ruby, go etc)
4. Custom `rbqbo.sh` script in `bin/`. Remove or alter to your needs.

## thanks

I forked [Zach Holman](http://github.com/holman)' excellent
[dotfiles](http://github.com/holman/dotfiles) and simply modified it to suit my needs (with some Intuit QBO Support).

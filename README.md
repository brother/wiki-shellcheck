# ShellCheck Wiki lookup

Fast and easy lookup in the Shellcheck Wiki.

## What is Shellcheck?

ShellCheck is a GPLv3 tool that gives warnings and suggestions for
bash/sh shell scripts:

The goals of ShellCheck are

  - To point out and clarify typical beginner's syntax issues
    that cause a shell to give cryptic error messages.

  - To point out and clarify typical intermediate level semantic problems
    that cause a shell to behave strangely and counter-intuitively.

  - To point out subtle caveats, corner cases and pitfalls that may cause an
    advanced user's otherwise working script to fail under future circumstances.

Read more at https://github.com/koalaman/shellcheck/wiki

## Setup

Clone the shellcheck wiki:
  - git clone https://github.com/koalaman/shellcheck.wiki.git
  - Configure the path to the clone
    - export SHELLCHECKWIKIPATH=$(pwd)/shellcheck.wiki.git
    - edit XDG_CONFIG_HOME/shellcheck.wiki.cfg
      path=/location/of/your/clone
  - Place the script at your PATH.

## Config

Config can be set either in environment via export or in a file called
shellcheck.wiki.cfg in $XDG_CONFIG_HOME. XDG_CONFIG_HOME is generally
~/.config.

The two settings availabel for config are the path to the Shellcheck
wiki git clone and if that should be updated or not.

Example:
```sh
brother ~$ export SHELLCHECKWIKIPATH=/home/brother/git/other/shellcheck.wiki
brother ~$ export SHELLCHECKWIKIUPDATE=background


brother ~$ cat .config/shellcheck.wiki.cfg
path=/home/brother/git/other/shellcheck.wiki
update=background
```

The git pull setting can be either always or background. The default
setting is to never update the clone. If set to always update it will
also warn about failures in the update as it will do the update inline
before checking for the search key.

## Usage

```sh
brother ~$ wiki-shellcheck.sh SC2046
SC2046: Quote this to prevent word splitting
brother ~$ wiki-shellcheck.sh SC2005
SC2005: Quote this to prevent word splitting
```

## TODO

 - Verbose mode, output more/all of page not just the title.
 - Rewrite parts where awk and sed is used to fetch information from
   files.
 - Add smartness to decide if the git clone of the wiki needs updating
   or not (second query in two minutes probably can cope without).

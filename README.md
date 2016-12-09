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

## Usage

...

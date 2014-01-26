#What's Installed

Simple Bash script to find out what packages you've polluted your machine with.

### Requires:

* Bash 4

### Currently supports:

* Homebrew
* PIP
* NPM
* Mac Ports
* Ruby Gems

### Usage

Generate .txt files for each package manager:

    $ ./whats_installed.sh

Generate one full list of packages:

    $ ./whats_installed.sh --full_list

Clean up generated files:

    $ ./whats_installed.sh --cleanup

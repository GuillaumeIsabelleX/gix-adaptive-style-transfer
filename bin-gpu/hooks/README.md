
- [Intentions](#intentions)
- [Assumptions](#assumptions)
- [Hooks](#hooks)
  - [bashrc-entering-container.sh](#bashrc-entering-containersh)
  - [entering-msg.txt](#entering-msgtxt)
# Intentions

* Hook when stuff arrives in container

# Assumptions

* All container mount the current directory context in /work so /work/hooks in always the same path

# Hooks

## [bashrc-entering-container.sh](bashrc-entering-container.sh)

Runs when entering the container.

## [entering-msg.txt](entering-msg.txt)

* catted file when login.
* Show ASCII art :)
* Show relevant information (credits and stuff)


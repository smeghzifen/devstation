# SAMPLE: files in setup directory
# /Users/smeghzifene/Developpement/repositories/github/devstation/setup/env-setup.bat.sh
# /Users/smeghzifene/Developpement/repositories/github/devstation/setup/env-setup.sh



# i : ignore case
$ grep -i "setlocal"

# n : number of the line
$ grep -n "setlocal"

# r : recursive
$ grep -rn "setlocal"

# -v reverse matching
$ grep -rn "setlocal" -v

# L: fichiers dans lequels ne figure le motif
$ grep -rnL "setlocal"

# l: fichiers dans lequels figure le motif
$ grep -rnl "setlocal"



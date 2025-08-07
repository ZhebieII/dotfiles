if pgrep -x "clash" > /dev/null; then
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  export HTTP_PROXY="http://127.0.0.1:7890"
  export HTTPS_PROXY="http://127.0.0.1:7890"
  export all_proxy="http://127.0.0.1:7891"
  export ALL_PROXY="http://127.0.0.1:7891"
else
  unset http_proxy
  unset https_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset all_proxy
  unset ALL_PROXY
fi

# or you can try the solution as below
#export http_proxy=http://127.0.0.1:7890
#export https_proxy=http://127.0.0.1:7890

# use proxy in the WSL
# export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
# export https_proxy="http://${hostip}:7890"
# export http_proxy="http://${hostip}:7890"




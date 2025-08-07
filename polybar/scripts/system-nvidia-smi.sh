#!/bin/sh

text=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
#echo "%{F#7aa2f7}""%{F#a9b1d6}"$text"%"
echo $text"% "
#󰢮

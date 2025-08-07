#!/bin/bash

# 临时锁屏背景图
WALLPAPER="$HOME/Pictures/wallpapers/13963.jpg"  # 你的锁屏底图

# 截屏模糊
TMPBG="/tmp/lockscreen.png"

cp "$WALLPAPER" "$TMPBG"

# 字体
FONT="Raleway"

# 获取加速版天气（用你的 weather.sh，保存在 ~/.config/i3/weather.sh）
DATE=$(date '+%A, %d %B %Y')
TIME=$(date '+%H:%M')


# 添加文字（时间、日期、天气）
#magick "$TMPBG" \
#  -font "$FONT" -pointsize 50 -fill white -annotate +0-50 "$TIME" \
#  -font "$FONT" -pointsize 30 -fill white -annotate +0+20 "$DATE" \
#  "$TMPBG"

# 锁屏
i3lock -i "$TMPBG"


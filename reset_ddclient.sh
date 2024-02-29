#!/bin/bash

# 脚本用于删除ddclient缓存文件并重启服务

# 定义缓存文件路径
CACHE_FILE="/var/cache/ddclient/ddclient.cache"

# 停止ddclient服务
echo "正在停止ddclient服务..."
systemctl stop ddclient

# 检查缓存文件是否存在，并删除它
if [ -f "$CACHE_FILE" ]; then
    echo "正在删除ddclient缓存文件..."
    rm -f "$CACHE_FILE"
else
    echo "缓存文件不存在，跳过删除步骤。"
fi

# 重新启动ddclient服务
echo "正在启动ddclient服务..."
systemctl start ddclient

# 显示服务状态
echo "ddclient服务状态："
systemctl status ddclient

# 脚本结束
echo "缓存清理完毕，ddclient已重新启动。"

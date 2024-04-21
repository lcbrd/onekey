#!/bin/bash

# 定义一个函数来更新系统
update_system() {
    DISTRO=$(lsb_release -i -s)

    # 根据发行版执行更新命令
    case "$DISTRO" in
        "Ubuntu")
            # Ubuntu系统使用apt进行更新
            sudo apt update && sudo apt upgrade -y
            ;;
        "Debian")
            # Debian系统使用apt进行更新
            sudo apt update && sudo apt upgrade -y
            ;;
        "CentOS")
            # CentOS系统使用yum进行更新
            sudo yum update -y
            ;;
        "Red Hat Enterprise Linux")
            # RHEL系统使用yum进行更新
            sudo yum update -y
            ;;
        "Fedora")
            # Fedora系统使用dnf进行更新
            sudo dnf upgrade -y
            ;;
        *)
            echo "Unsupported distribution: $DISTRO"
            exit 1
            ;;
    esac

    echo "System updated successfully."
}

change_orig() {

# 文件名
    filename="/etc/apt/sources.list1"

    # 检查文件中是否包含"qinghua"
    if ! grep -q "tsinghua" "$filename"; then
        echo "文件中没有找到'tsinghua'镜像，将进行替换。"

        # 备份原始文件
        cp "$filename" "$filename.bak"

        # 使用sed替换所有的"rasp"为"qinghua"
        sed -i 's/deb\.debian\.org/mirrors\.tuna\.tsinghua\.edu\.cn/g' "$filename"

        echo "所有'rasp'已被替换为'tsinghua'。"
    else
        echo "文件中已包含'tsinghua'，不做任何更改。"
    fi
}
update_system

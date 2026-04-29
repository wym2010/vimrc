#!/bin/bash

# 1. 安装 fcitx5 全家桶
sudo dnf install -y fcitx5 fcitx5-rime fcitx5-chinese-addons fcitx5-gtk3 fcitx5-gtk4 fcitx5-qt5

# 2. 写入全局环境变量（~/.pam_environment）
cat > ~/.pam_environment << EOF
GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE DEFAULT=fcitx
XMODIFIERS DEFAULT=@im=fcitx
INPUT_METHOD DEFAULT=fcitx5
EOF

# 3. 配置 Niri：禁用自带 Super+Space，加环境变量，自启 fcitx5
mkdir -p ~/.config/niri
cat > ~/.config/niri/config.kdl << EOF
environment {
  GTK_IM_MODULE "fcitx"
  QT_IM_MODULE "fcitx"
  XMODIFIERS "@im=fcitx"
}

spawn-at-startup "fcitx5"

EOF

echo "✅ 配置完成！重启 Niri（Mod+Shift+R）后，在 fcitx5 设置里把切换快捷键设为 Super+Space 即可。"

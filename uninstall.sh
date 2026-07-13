#!/bin/bash

echo "Memulai penghapusan konfigurasi dari sistem..."

# 1. Menghapus folder konfigurasi desktop
rm -rf ~/.config/niri
rm -rf ~/.config/waybar
rm -rf ~/.config/fuzzel
rm -rf ~/.config/wlogout

# 2. Menghapus eksekutor skrip wallpaper dari bin lokal
rm -f ~/.local/bin/wallpaper-picker

# 3. Menghapus file contoh wallpaper bawaan agar bersih tanpa sisa
# (Ini hanya menghapus file yang namanya ada di dalam folder sample-wallpapers bawaan)
cd ~/niri-dotfile && rm -f ~/Pictures/wallpaper/contoh-retrowave.png 2>/dev/null

echo "Pembersihan selesai! Semua file konfigurasi telah dihapus."

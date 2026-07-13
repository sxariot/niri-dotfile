#!/bin/bash

# ==========================================================
# 1. PENGINSTALAN ALAT-ALAT / DEPENDENSI (openSUSE)
# ==========================================================
echo "Memulai instalasi alat-alat pendukung desktop..."
sudo zypper in -y niri waybar fuzzel wlogout swaylock brightnessctl alacritty pavucontrol swaybg

# ==========================================================
# 2. MEMBUAT DIREKTORI / FOLDER TUJUAN
# ==========================================================
echo "Membuat folder konfigurasi di sistem..."
mkdir -p ~/.config/niri
mkdir -p ~/.config/waybar
mkdir -p ~/.config/fuzzel
mkdir -p ~/.config/wlogout
mkdir -p ~/.local/bin
mkdir -p ~/Pictures/wallpaper  # <--- Membuat folder wallpaper otomatis

# ==========================================================
# 3. MENYALIN FILE KONFIGURASI DARI REPO KE SISTEM
# ==========================================================
echo "Menyalin file konfigurasi baru..."
cp -r .config/niri/* ~/.config/niri/
cp -r .config/waybar/* ~/.config/waybar/
cp -r .config/fuzzel/* ~/.config/fuzzel/
cp wlogout/layout ~/.config/wlogout/layout

# Menyalin contoh gambar dari repo ke folder Pictures agar tidak blank hitam
cp sample-wallpapers/* ~/Pictures/wallpaper/  # <--- Menyalin gambar contoh otomatis

# Menyalin skrip pemilih wallpaper ke folder bin lokal sistem
cp bin/wallpaper-picker.sh ~/.local/bin/wallpaper-picker

echo "Instalasi selesai! Silakan log out dan masuk ke sesi Niri."

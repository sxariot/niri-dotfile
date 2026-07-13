#!/bin/bash

# ==========================================================
# 1. MEMBUAT DIREKTORI / FOLDER TUJUAN
# ==========================================================
echo "Membuat folder konfigurasi di sistem..."
mkdir -p ~/.config/niri
mkdir -p ~/.config/waybar
mkdir -p ~/.config/fuzzel
mkdir -p ~/.config/wlogout

# ==========================================================
# 2. MENYALIN FILE KONFIGURASI DARI REPO KE SISTEM
# ==========================================================
echo "Menyalin file konfigurasi baru..."
cp -r .config/niri/* ~/.config/niri/
cp -r .config/waybar/* ~/.config/waybar/
cp -r .config/fuzzel/* ~/.config/fuzzel/
cp wlogout/layout ~/.config/wlogout/layout

echo "Instalasi selesai!"


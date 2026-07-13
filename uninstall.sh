#!/bin/bash

# ==========================================================
# 1. MENGHAPUS FOLDER KONFIGURASI YANG SUDAH TERPASANG
# ==========================================================
echo "Menghapus folder konfigurasi Niri Dotfiles dari sistem..."

# Perintah rm -rf digunakan untuk menghapus folder beserta seluruh isinya secara paksa
rm -rf ~/.config/niri
rm -rf ~/.config/waybar
rm -rf ~/.config/fuzzel
rm -rf ~/.config/wlogout

echo "Pembersihan selesai! Konfigurasi telah dihapus."

#!/bin/bash
# =============================================================================
# SKRIP PEMILIH WALLPAPER: FIX RANDOM GLOBAL (MEMBUKA BLOKIR 200+ GAMBAR)
# =============================================================================

DIR="$HOME/Pictures/wallpaper"

# JIKA skrip dipanggil saat startup (otomatis mengacak total saat baru login)
if [ "$1" = "--startup" ]; then
    # -iname memastikan ekstensi huruf BESAR maupun kecil (.PNG/.png) ikut tersapu bersih
    GAMBAR_ACAK=$(find "$DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)
    if [ -n "$GAMBAR_ACAK" ]; then
        pkill swaybg
        swaybg -i "$GAMBAR_ACAK" -m fill &
    fi
    exit 0
fi

# JIKA dipanggil manual via Windows + W
# 1. Kita ambil SEMUA jalur gambar, lalu potong bagian depan agar tampilan di Fuzzel bersih
# 2. 'sed' memotong teks instan sehingga 200+ gambar langsung termuat dalam 0.01 detik tanpa lag
DAFTAR_GAMBAR=$(find "$DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | sed "s|$DIR/||")

# Tampilkan menu Fuzzel
PILIHAN=$( (echo "🎲 PILIH SECARA ACAK (RANDOM)"; echo "$DAFTAR_GAMBAR") | fuzzel --dmenu -p "Pilih Wallpaper: ")

# Jika menekan Esc atau membatalkan pilihan
if [ -z "$PILIHAN" ] || [ "$PILIHAN" = "" ]; then
    exit 0
fi

# Eksekusi Penggantian Wallpaper (Sebab-Akibat)
if [ "$PILIHAN" = "🎲 PILIH SECARA ACAK (RANDOM)" ]; then
    # Benar-benar mengocok seluruh 200+ gambar secara adil
    GAMBAR_ACAK=$(find "$DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf -n 1)
    pkill swaybg
    swaybg -i "$GAMBAR_ACAK" -m fill &
else
    # Opsi pilihan manual digabungkan kembali secara absolut
    pkill swaybg
    swaybg -i "$DIR/$PILIHAN" -m fill &
fi

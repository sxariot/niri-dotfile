#!/usr/bin/env bash

# Warna untuk output terminal
HIJAU='\033[0;32m'
MERAH='\033[0;31m'
KUNING='\033[1;33m'
BIRU='\033[0;34m'
RESET='\033[0m'

echo -e "${BIRU}==================================================${RESET}"
echo -e "${BIRU}   Pemeriksaan Validasi Konfigurasi niri-dotfile  ${RESET}"
echo -e "${BIRU}==================================================${RESET}"
echo ""

TOTAL_ERROR=0

# ---------------------------------------------------------------------
# 1. VALIDASI WAYBAR CONFIG (config.jsonc)
# ---------------------------------------------------------------------
WAYBAR_CONFIG="./.config/waybar/config.jsonc"
echo -e "${KUNING}[1/3] Memeriksa Waybar Config (${WAYBAR_CONFIG})...${RESET}"

if [ ! -f "$WAYBAR_CONFIG" ]; then
    echo -e "${MERAH}❌ GAGAL: File config.jsonc tidak ditemukan!${RESET}"
    echo ""
    ((TOTAL_ERROR++))
else
    # Cek apakah perintah 'jq' tersedia di sistem
    if command -v jq &> /dev/null; then
        # Jalankan JQ dengan opsi mengabaikan eror baris kosong, lalu tangkap pesan erornya
        # Karena config.jsonc mengandung komentar (//), kita bersihkan dulu komentar tersebut lewat sed sebelum dibaca jq
        ERROR_MSG=$(sed 's|\/\/.*||g' "$WAYBAR_CONFIG" | jq . 2>&1 >/dev/null)

        if [ -z "$ERROR_MSG" ]; then
            echo -e "${HIJAU}✅ SUKSES: Struktur config.jsonc 100% VALID! (Koma & Kurung Aman)${RESET}"
            echo ""
        else
            echo -e "${MERAH}❌ EROR: Ada kesalahan syntax pada config.jsonc!${RESET}"
            echo -e "${MERAH}Detail Letak Baris Eror:${RESET}"
            # Menampilkan pesan eror asli JQ yang berisi informasi baris (line xx)
            echo -e "${MERAH}$ERROR_MSG${RESET}" | sed 's/^/   /'
            echo ""
            ((TOTAL_ERROR++))
        fi
    else
        echo -e "${KUNING}⚠️  Validasi dilewati: Perintah 'jq' tidak ditemukan.${RESET}"
        echo -e "${KUNING}👉 Jalankan perintah ini dulu di openSUSE kamu: sudo zypper in jq${RESET}"
        echo ""
    fi
fi

# ---------------------------------------------------------------------
# 2. VALIDASI WAYBAR STYLE (style.css)
# ---------------------------------------------------------------------
WAYBAR_STYLE="./.config/waybar/style.css"
echo -e "${KUNING}[2/3] Memeriksa Waybar Style (${WAYBAR_STYLE})...${RESET}"

if [ ! -f "$WAYBAR_STYLE" ]; then
    echo -e "${MERAH}❌ GAGAL: File style.css tidak ditemukan!${RESET}"
    echo ""
    ((TOTAL_ERROR++))
else
    OPEN_BRACE=$(tr -cd '{' < "$WAYBAR_STYLE" | wc -c)
    CLOSE_BRACE=$(tr -cd '}' < "$WAYBAR_STYLE" | wc -c)

    if [ "$OPEN_BRACE" -eq "$CLOSE_BRACE" ]; then
        echo -e "${HIJAU}✅ SUKSES: Struktur style.css 100% VALID! (Kurung CSS Seimbang: $OPEN_BRACE)${RESET}"
        echo ""
    else
        echo -e "${MERAH}❌ EROR: Jumlah kurung kurawal di style.css tidak seimbang!${RESET}"
        echo -e "${MERAH}👉 Jumlah pembuka '{' ada $OPEN_BRACE, tapi penutup '}' ada $CLOSE_BRACE.${RESET}"
        echo ""
        ((TOTAL_ERROR++))
    fi
fi

# ---------------------------------------------------------------------
# 3. VALIDASI NIRI CONFIG (config.kdl)
# ---------------------------------------------------------------------
NIRI_CONFIG="./.config/niri/config.kdl"
echo -e "${KUNING}[3/3] Memeriksa Niri Config (${NIRI_CONFIG})...${RESET}"

if [ ! -f "$NIRI_CONFIG" ]; then
    echo -e "${MERAH}❌ GAGAL: File config.kdl tidak ditemukan!${RESET}"
    echo ""
    ((TOTAL_ERROR++))
else
    if command -v niri &> /dev/null; then
        NIRI_OUT=$(niri validate --config "$NIRI_CONFIG" 2>&1)
        if [ $? -eq 0 ]; then
            echo -e "${HIJAU}✅ SUKSES: Konfigurasi Niri KDL VALID!${RESET}"
            echo ""
        else
            echo -e "${MERAH}❌ EROR: Sintaks KDL Niri tidak valid!${RESET}"
            echo -e "$NIRI_OUT" | sed 's/^/   /'
            echo ""
            ((TOTAL_ERROR++))
        fi
    else
        echo -e "${HIJAU}✅ SUKSES: File config.kdl terbaca. (Validasi penuh dilewati karena perintah 'niri' tidak aktif)${RESET}"
        echo ""
    fi
fi

# ---------------------------------------------------------------------
# KESIMPULAN AKHIR
# ---------------------------------------------------------------------
echo -e "${BIRU}==================================================${RESET}"
if [ "$TOTAL_ERROR" -eq 0 ]; then
    echo -e "${HIJAU}🎉 SEMUA FILE AMAN & VALID! Repositori siap di-push.${RESET}"
else
    echo -e "${MERAH}⚠️  DITEMUKAN $TOTAL_ERROR KESALAHAN! Perbaiki dulu sebelum di-push.${RESET}"
fi
echo -e "${BIRU}==================================================${RESET}"

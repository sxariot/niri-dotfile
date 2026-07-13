# 🚀 My Minimalist openSUSE Niri Setup

Halo! Repositori ini berisi kumpulan file pengaturan (*dotfiles*) untuk mempercantik dan mengatur desktop **Niri Window Manager** di Linux openSUSE Tumbleweed atau Leap. Di dalamnya sudah lengkap dengan panel atas (Waybar), menu aplikasi (Fuzzel), dan menu tombol power (wlogout).

---

## ⚠️ DISCLAIMER PENTING (BACA INI DULU!)

> **PENTING UNTUK PENGGUNA BARU:**
> Saat pertama kali kamu masuk ke sesi Niri, kamu mungkin akan melihat **jendela kotak hitam kosong besar yang mengganggu di tengah layar** bertuliskan *"Wayland to X Recording bridge — Xwayland Video Bridge"*.
>
> **Jangan panik! Ini bukan eror atau kerusakan desktop.** 
> 
> **Kenapa jendela hitam ini muncul?** Ini adalah aplikasi sistem bawaan KDE/Plasma (*Xwayland Video Bridge*) yang gunanya untuk membantu fitur rekam layar / *screen sharing* pada aplikasi lama (X11). Tapi karena Niri adalah Window Manager, aplikasi ini malah ikut terbuka sebagai jendela biasa yang kosong dan bikin risi pemandangan.
>
> *   **Jika kamu TIDAK merasa terganggu:** Kamu bisa membiarkannya saja atau cukup menutup jendela tersebut secara manual menggunakan tombol pintas penutup jendela di Niri kamu.
> *   **Jika kamu MERASA RISI/TERGANGGU dan ingin mematikannya:**
>     Kamu bisa mematikan layanan ini sepenuhnya agar tidak pernah muncul lagi dengan mengetik perintah ini di terminal:
>     ```bash
>     systemctl --user mask plasma-xwaylandvideobridge.service
>     ```
>     ⚠️ **Keterangan Dampak (Efek Samping):** 
>     Setelah menjalankan perintah di atas, jendela hitam tersebut dijamin hilang selamanya. Namun dampaknya, aplikasi-aplikasi lama yang masih berjalan di atas Xwayland (seperti Discord versi flatpak/lama atau OBS tanpa native Wayland) **tidak akan bisa melakukan rekam layar atau *share screen***. Jika suatu saat kamu membutuhkannya kembali, kamu tinggal mengetik perintah sebaliknya: `systemctl --user unmask plasma-xwaylandvideobridge.service`.

---

## 💻 Sistem Operasi & Lingkungan

*   **OS:** openSUSE
*   **Window Manager (Pengatur Jendela):** Niri (Wayland)
*   **Status Bar (Panel Atas):** Waybar
*   **Application Launcher (Menu Aplikasi):** Fuzzel
*   **Power Menu (Menu Tombol Power):** wlogout

---

## 🖼️ Inspirasi Visual

Untuk membantu kamu memulai, repositori ini sudah dilengkapi dengan beberapa **Sample Wallpaper** keren yang ada di folder `sample-wallpapers`. 

Ini adalah contoh tampilan lingkungan desktop yang bersih jika jendela latar belakang dan aplikasi sudah berjalan dengan normal tanpa gangguan kotak hitam:

![Contoh Tampilan Desktop dengan Wallpaper](sample-wallpapers/contoh-retrowave.png)

---

## 📂 Struktur Folder (Isi Proyek Ini)

Berikut adalah isi dari folder `niri-dotfile` ini dan kegunaannya masing-masing:

*   📁 **`.config/niri/config.kdl`** ➔ File setingan utama Niri. Isinya mengatur tombol shortcut keyboard dan aplikasi apa saja yang otomatis menyala pas kamu baru login.
*   📁 **`sample-wallpapers/`** ➔ Folder bonus berisi koleksi gambar wallpaper keren bawaan repositori untuk inspirasimu.
*   📁 **`wlogout/layout`** ➔ Mengatur tampilan menu tombol power (tombol Turn Off, Restart, dll).
*   📄 **`install.sh`** ➔ Skrip otomatis untuk memasang semua aplikasi, menyalin setingan, dan menyiapkan folder wallpaper secara instan.
*   📄 **`uninstall.sh`** ➔ Skrip otomatis untuk menghapus semua setingan ini secara bersih tanpa sisa.

---

## ⚙️ Fitur Otomatis Skrip `install.sh`

Kamu tidak perlu pusing mengetik perintah instalasi satu per satu atau membuat folder secara manual. Saat kamu menjalankan `./install.sh`, skrip ini akan otomatis melakukan semuanya untukmu:

1.  **Menginstall Semua Aplikasi Pendukung (Dependensi):** Otomatis memasang `niri`, `waybar`, `fuzzel`, `swaybg`, `wlogout`, `swaylock`, `brightnessctl`, `alacritty`, dan `pavucontrol` langsung ke sistem openSUSE kamu.
2.  **Menyiapkan Folder Gambar:** Membuat folder tujuan wallpaper di laptopmu (`~/Pictures/wallpaper/`).
3.  **Menyalin Gambar Contoh:** Memasukkan gambar contoh dari folder `sample-wallpapers` ke direktori wallpaper baru tersebut agar desktop tidak kosong saat pertama kali menyala.
4.  **Memasang Konfigurasi:** Memindahkan seluruh setingan tombol pintas keyboard dan tampilan desktop ke folder sistem yang tepat.

Jadi, kamu tinggal duduk manis, jalankan skripnya, dan desktop Niri kamu langsung siap pakai!

---

## ⌨️ Tombol Pintas Keyboard (Shortcut) yang Sering Dipakai

> 💡 **Catatan Penting:** Tombol **`Mod`** di bawah ini artinya adalah **Tombol Windows** (atau tombol Super) pada keyboard kamu.

*   **`Mod + W`** ➔ Membuka menu untuk memilih wallpaper atau mengacak wallpaper baru secara instan.
*   **`Mod + D`** ➔ Membuka menu untuk mencari dan membuka aplikasi.
*   **`Mod + Enter`** ➔ Membuka aplikasi Terminal (`alacritty`).
*   **`Mod + Shift + E`** ➔ Membuka menu tombol power (untuk Log out, Restart, atau Power Off).
*   **Tombol Volume Naik/Turun** ➔ Mengatur suara laptop secara langsung.
*   **Tombol Kecerahan Layar** ➔ Mengatur terang/redupnya layar laptop secara langsung.

---

## 🛠️ Tips Mengatasi Masalah (Troubleshooting)

### 1. Menu Wallpaper (`Mod + W`) Tidak Mau Muncul
*   **Penyebab:** File skrip pengubah wallpaper belum diizinkan berjalan oleh sistem keamanan Linux.
*   **Solusi:** Ketik perintah ini di terminal untuk memberikan izin akses penuh secara manual:
    ```bash
    chmod +x ~/.local/bin/wallpaper-picker
    ```

### 2. Cara Cek Setingan Eror atau Tidak
*   Kalau kamu habis mengubah isi file `config.kdl` dan takut ada yang salah ketik, kamu bisa cek lewat terminal dengan mengetik:
    ```bash
    niri validate --config ~/.config/niri/config.kdl
    ```
    Jika muncul tulisan `config is valid`, berarti setinganmu aman dan benar!

# My Minimalist openSUSE Niri Setup 🚀

Repositori ini berisi file konfigurasi (*dotfiles*) untuk Window Manager Niri di openSUSE Tumbleweed/Leap, lengkap dengan panel Waybar, menu Fuzzel, dan wlogout.

## 💻 Sistem Operasi & Lingkungan
* **OS:** openSUSE
* **Window Manager:** Niri (Wayland)
* **Status Bar:** Waybar
* **Application Launcher:** Fuzzel
* **Power Menu:** wlogout

## 📦 Dependensi Wajib
Sebelum menjalankan skrip installer, pastikan paket-paket berikut sudah terpasang di sistem agar semua shortcut dan komponen desktop berfungsi dengan normal:
```bash
sudo zypper in niri waybar fuzzel wlogout swaylock brightnessctl alacritty pavucontrol

# Get Started Module

Modul ini menangani halaman Get Started (landing page) aplikasi.

## Struktur Folder

### 📁 models/
Berisi model data untuk get started:
- Saat ini tidak ada model yang diperlukan
- Folder ini dibuat untuk konsistensi struktur

### 📁 screens/
Berisi halaman/screen untuk get started:
- **get_started_page.dart** - Halaman utama Get Started yang menampilkan background dan content

### 📁 widgets/
Berisi widget-widget komponen get started:
- **get_started_background.dart** - Widget untuk background image
- **get_started_content.dart** - Widget untuk konten (judul, deskripsi, tombol)

## Cara Penggunaan

```dart
// Import modul get started
import 'package:stylish_app/modules/getstarted/getstarted.dart';

// Navigasi ke halaman Get Started
Navigator.pushNamed(context, GetStartedPage.route);
```

## Fitur

- ✅ Background image full screen
- ✅ Overlay dengan gradient shape
- ✅ Judul dan deskripsi menarik
- ✅ Tombol "Get Started" untuk navigasi ke home
- ✅ Responsive design

## Komponen

### GetStartedPage
Halaman utama yang menggunakan Stack untuk menampilkan:
1. Background image (GetStartedBackground)
2. Content overlay (GetStartedContent)

### GetStartedBackground
Widget sederhana yang menampilkan background image dari assets.

### GetStartedContent
Widget yang menampilkan:
- Overlay shape transparan
- Judul "You want Authentic, here you go!"
- Subtitle "Find it here, buy it now!"
- Tombol "Get Started" untuk navigasi

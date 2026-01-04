# Filter Module

Modul ini menangani fungsionalitas filter produk dalam aplikasi.

## Struktur Folder

### 📁 models/
Berisi model data untuk filter:
- **filter_result.dart** - Model untuk menyimpan hasil filter (price range, category, size, color)

### 📁 screens/
Berisi halaman/screen untuk filter:
- **filter_drawer_page.dart** - Halaman utama filter drawer yang menampilkan semua opsi filter

### 📁 widgets/
Berisi widget-widget komponen filter:
- **category_filter_section.dart** - Widget untuk memilih kategori produk
- **color_filter_section.dart** - Widget untuk memilih warna produk
- **filter_action_buttons.dart** - Widget untuk tombol Discard dan Apply
- **filter_header.dart** - Widget untuk header filter drawer
- **price_range_section.dart** - Widget untuk input range harga
- **size_filter_section.dart** - Widget untuk memilih ukuran produk

## Cara Penggunaan

```dart
// Import modul filter
import 'package:stylish_app/modules/filter/filter.dart';

// Menampilkan filter drawer
final result = await showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (context) => FilterDrawerPage(
    initialPriceRange: RangeValues(0, 1000),
  ),
);

// Menggunakan hasil filter
if (result != null && result is Map) {
  final filterResult = FilterResult.fromMap(result);
  // Gunakan filterResult untuk filter produk
}
```

## Fitur

- ✅ Filter berdasarkan range harga
- ✅ Filter berdasarkan warna (5 pilihan)
- ✅ Filter berdasarkan ukuran (XS, S, M, L, XL, XXL)
- ✅ Filter berdasarkan kategori (All, Women, Men, Kids, Boys, Girls)
- ✅ Reset filter (Discard)
- ✅ Apply filter dengan validasi

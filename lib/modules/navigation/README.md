# Navigation Module

Modul ini menangani bottom navigation bar dan navigasi antar halaman utama aplikasi.

## Struktur Folder

### 📁 screens/
Berisi halaman/screen untuk navigation:
- **navigation_page.dart** - Halaman utama dengan bottom navigation

### 📁 widgets/
Berisi widget-widget komponen navigation:
- **bottom_nav.dart** - Bottom navigation bar
- **cart_button.dart** - Tombol cart khusus di navbar

## Cara Penggunaan

```dart
// Import modul navigation
import 'package:stylish_app/modules/navigation/navigation.dart';

// Navigasi ke halaman dengan tab tertentu
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const NavigationPage(initialIndex: 0),
  ),
);
```

## Fitur

- ✅ Bottom navigation dengan 5 tab
- ✅ Custom cart button dengan styling khusus
- ✅ Double back press to exit
- ✅ Tab persistence
- ✅ Smooth transitions

## Navigation Tabs

1. **Home** (Index 0) - Homepage dengan produk
2. **Wishlist** (Index 1) - Daftar wishlist
3. **Cart** (Index 2) - Keranjang belanja (custom button)
4. **Search** (Index 3) - Pencarian produk
5. **Settings** (Index 4) - Pengaturan aplikasi

## Komponen

### NavigationPage
Halaman utama yang mengelola:
- Tab selection state
- Page switching
- Back button handling (double press to exit)
- Bottom navigation bar

### BottomNav
Custom bottom navigation bar dengan:
- 5 navigation items
- Active/inactive states
- Custom cart button di tengah
- Icon dan label untuk setiap tab

### CartButton
Tombol cart khusus dengan:
- Circular design
- Elevated appearance
- Active/inactive states
- Custom styling

## Widget Structure

```
NavigationPage
├── SafeArea
│   └── _pages[_selectedIndex]
│       ├── HomeContent (index 0)
│       ├── WishlistPage (index 1)
│       ├── CartPage (index 2)
│       ├── SearchPage (index 3)
│       └── SettingsPage (index 4)
└── BottomNav
    ├── NavItem (Home)
    ├── NavItem (Wishlist)
    ├── CartButton (Cart)
    ├── NavItem (Search)
    └── NavItem (Settings)
```

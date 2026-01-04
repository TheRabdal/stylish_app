# Homepage Module

Modul ini menangani halaman utama (homepage) aplikasi yang menampilkan berbagai produk dan promosi.

## Struktur Folder

### 📁 models/
Berisi model data untuk homepage:
- **product_data.dart** - Data produk untuk trending, deal of day, dan wishlist
  - `trendingProductsList` - List produk trending
  - `dealOfDayProductsList` - List produk deal of day
  - `wishlistProductsList` - List produk wishlist
  - `allProducts` - Gabungan semua produk

### 📁 screens/
Berisi halaman/screen untuk homepage:
- **home_page.dart** - Halaman utama homepage (wrapper sederhana)

### 📁 widgets/
Berisi widget-widget komponen homepage:
- **home_app_bar.dart** - AppBar dengan logo dan profile
- **home_search_bar.dart** - Search bar untuk mencari produk
- **home_content.dart** - Konten utama homepage dengan scroll
- **category_section.dart** - Section kategori produk
- **promo_banner.dart** - Banner promosi dengan auto-scroll
- **sponsored_banner.dart** - Banner sponsor
- **flat_heels_banner.dart** - Banner khusus flat & heels
- **new_arrivals.dart** - Section produk baru
- **deal_of_day.dart** - Section deal of day dengan countdown
- **trending_products.dart** - Section produk trending
- **special_offers.dart** - Section penawaran spesial
- **product_card.dart** - Card untuk menampilkan produk

## Cara Penggunaan

```dart
// Import modul homepage
import 'package:stylish_app/modules/homepage/homepage.dart';

// Navigasi ke homepage
Navigator.pushNamed(context, HomePage.route);

// Atau gunakan widget langsung
const HomePage();
```

## Fitur

### 🏠 Home Content
- ✅ Scrollable content dengan CustomScrollView
- ✅ Search functionality
- ✅ Filter by price range
- ✅ Sort by price (low to high / high to low)
- ✅ Refresh to load data

### 🎨 UI Components
- ✅ Custom AppBar dengan logo
- ✅ Search bar dengan icon
- ✅ Category buttons
- ✅ Auto-scrolling promo banners
- ✅ Sponsored product banner
- ✅ Flat & Heels banner dengan overlay
- ✅ New Arrivals section
- ✅ Deal of Day dengan countdown timer
- ✅ Trending Products dengan date display
- ✅ Special Offers grid
- ✅ Product cards dengan rating dan discount

### 📊 Data Management
- ✅ Static product data (dapat diganti dengan API)
- ✅ Filter dan sort functionality
- ✅ Search dengan case-insensitive
- ✅ Product navigation ke detail page

## Komponen Detail

### HomeContent
Widget utama yang mengelola:
- State untuk search, filter, dan sort
- CustomScrollView dengan SliverList
- Integration dengan FilterDrawerPage dan SortPage
- Product grid display

### Product Card
Menampilkan:
- Product image
- Product name dan description
- Price dengan old price (strikethrough)
- Discount percentage
- Rating dengan stars
- Review count

### Deal of Day
Fitur khusus:
- Countdown timer (jam, menit, detik)
- Horizontal scrollable products
- "View All" button

### Trending Products
Fitur khusus:
- Current date display (auto-update setiap menit)
- Horizontal scrollable products
- "View All" button

## 🎯 Navigation Flow

```
HomePage
  ├─> ProductDetailPage (tap product card)
  ├─> SearchPage (tap search bar)
  ├─> FilterDrawerPage (tap filter icon)
  └─> SortPage (tap sort icon)
```

## 📦 Dependencies

- `google_fonts` - Typography
- `flutter/material.dart` - UI components
- Product models dari `core/models`
- Navigation dari `modules/navigation`
- Filter dari `modules/filter`
- Sort dari `modules/sort`

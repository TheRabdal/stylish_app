# Payment Module

Modul ini menangani fungsionalitas pembayaran dan pemilihan metode pembayaran.

## Struktur Folder

### 📁 models/
Berisi model data untuk payment:
- **payment_method_model.dart** - Model untuk metode pembayaran

### 📁 screens/
Berisi halaman/screen untuk payment:
- **payment_page.dart** - Halaman pemilihan metode pembayaran

### 📁 widgets/
Berisi widget-widget komponen payment:
- **payment_success_dialog.dart** - Dialog sukses pembayaran

## Cara Penggunaan

```dart
// Import modul payment
import 'package:stylish_app/modules/payment/payment.dart';

// Navigasi ke halaman payment
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const PaymentPage(),
  ),
);
```

## Fitur

- ✅ Pilihan metode pembayaran
- ✅ Payment method cards dengan icon
- ✅ Success dialog setelah pembayaran
- ✅ Navigation setelah sukses
- ✅ Clean UI dengan custom styling

## Komponen

### PaymentPage
Halaman utama untuk memilih metode pembayaran:
- List metode pembayaran
- Payment method cards
- Confirm payment button
- Success dialog

### PaymentMethodModel
Model untuk metode pembayaran:
```dart
class PaymentMethodModel {
  final String id;
  final String name;
  final String accountNumber;
  final String assetPath;
  final dynamic fallbackIcon;
}
```

### PaymentSuccessDialog
Dialog yang muncul setelah pembayaran berhasil:
- Success icon
- Success message
- Continue shopping button
- Auto navigation

## Widget Structure

```
PaymentPage
├── AppBar
├── Payment Methods List
│   └── PaymentMethodCard (multiple)
└── Confirm Button
    └── PaymentSuccessDialog (on success)
```

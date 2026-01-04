# Login Module

Modul ini menangani fungsionalitas login dan autentikasi pengguna.

## Struktur Folder

### 📁 models/
Berisi model data untuk login:
- **login_payload.dart** - Model untuk data login (email, password)

### 📁 screens/
Berisi halaman/screen untuk login:
- **login_page.dart** - Halaman utama login

### 📁 widgets/
Berisi widget-widget komponen login:
- **login_header.dart** - Header dengan logo dan welcome text
- **login_button.dart** - Tombol login utama
- **forgot_password.dart** - Link forgot password
- **sign_up_text.dart** - Text dengan link ke sign up
- **social_login.dart** - Section untuk login dengan social media
- **social_button.dart** - Tombol individual untuk social login

## Cara Penggunaan

```dart
// Import modul login
import 'package:stylish_app/modules/login/login.dart';

// Navigasi ke halaman login
Navigator.pushNamed(context, LoginPage.route);
```

## Fitur

- ✅ Email dan password input
- ✅ Form validation
- ✅ Forgot password link
- ✅ Sign up navigation
- ✅ Social login (Google, Apple, Facebook)
- ✅ Clean UI dengan custom widgets

## Komponen

### LoginPage
Halaman utama yang menggabungkan semua widget login:
- LoginHeader
- Email & Password fields
- LoginButton
- ForgotPassword link
- Divider dengan "OR"
- SocialLogin buttons
- SignUpText

### LoginPayload
Model untuk menyimpan data login:
```dart
class LoginPayload {
  final String email;
  final String password;
}
```

## Widget Structure

```
LoginPage
├── LoginHeader
├── CustomTextField (Email)
├── CustomTextField (Password)
├── ForgotPassword
├── LoginButton
├── Divider
├── SocialLogin
│   ├── SocialButton (Google)
│   ├── SocialButton (Apple)
│   └── SocialButton (Facebook)
└── SignUpText
```

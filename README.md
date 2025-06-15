# 🔥 Flutter Authentication Suite with Firebase

![Auth Screens Banner](https://i.imgur.com/5vJkK8l.png)  
*Modern authentication flow with sleek UI and Firebase integration*

## 🚀 Project Overview
A beautifully designed authentication system featuring SignIn and SignUp screens with Firebase backend integration. Built with Flutter's latest features for a smooth user experience.

```dart
[![Flutter Version](https://img.shields.io/badge/Flutter-3.19.5-blue?logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-3.3.0-blue)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-✅-orange?logo=firebase)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-brightgreen)](https://github.com/Umerjamshaid/flutter-auth-suite/pulls)
```

<div align="center">
  <a href="#features">Features</a> •
  <a href="#screens">Screens</a> •
  <a href="#tech-stack">Tech Stack</a> •
  <a href="#installation">Installation</a> •
  <a href="#structure">Structure</a> •
  <a href="#contributing">Contributing</a>
</div>

---

## ✨ Key Features
- **Modern UI Design**  
  Sleek animations, gradient buttons, and responsive layouts
- **Firebase Integration**  
  Secure authentication with Firestore database
- **Form Validation**  
  Real-time error checking with visual feedback
- **Password Management**  
  Toggle visibility and strength indicators
- **Responsive Design**  
  Works on mobile, tablet, and web
- **Social Sign-In**  
  Google, Facebook, and Apple authentication options
- **Dark/Light Mode**  
  Automatic theme switching based on system settings

---

## 📱 Screen Previews

| SignIn Screen | SignUp Screen | Success State |
|---------------|---------------|---------------|
| ![SignIn](https://i.imgur.com/8VlGxQp.png) | ![SignUp](https://i.imgur.com/9Xa2jO8.png) | ![Success](https://i.imgur.com/3z5Jk7M.png) |

---

## 🧩 Featured Widgets

### Gradient Button
```dart
GradientButton(
  onPressed: () {},
  gradient: LinearGradient(
    colors: [Colors.deepPurple, Colors.blueAccent],
  ),
  child: Text('SIGN UP', style: TextStyle(color: Colors.white)),
)
```

### Password Strength Indicator
```dart
PasswordStrengthIndicator(
  strength: _calculateStrength(password),
)
```

### Animated Input Field
```dart
AnimatedInputField(
  controller: emailController,
  icon: Icons.email,
  label: "Email Address",
  validator: (value) {
    if (!value.contains('@')) return 'Invalid email';
    return null;
  },
)
```

---

## 🛠️ Tech Stack
- **Frontend**: 
  ![Flutter](https://img.shields.io/badge/Flutter-3.19.5-02569B?logo=flutter)
  ![Dart](https://img.shields.io/badge/Dart-3.3.0-0175C2?logo=dart)
  
- **Backend**: 
  ![Firebase Auth](https://img.shields.io/badge/Firebase_Auth-✅-FFCA28?logo=firebase)
  ![Cloud Firestore](https://img.shields.io/badge/Firestore-✅-FFCA28?logo=firebase)
  
- **State Management**: 
  ![Provider](https://img.shields.io/badge/Provider-6.0.5-4CAF50)
  
- **Styling**: 
  ![Material 3](https://img.shields.io/badge/Material_3-✅-757575?logo=materialdesign)

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.19.5)
- Firebase project
- Android Studio/VSCode

### Installation
```bash
# Clone the repository
git clone https://github.com/Umerjamshaid/flutter-auth-suite.git

# Navigate to project
cd flutter-auth-suite

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Firebase Setup
1. Create a Firebase project at [firebase.google.com](https://firebase.google.com)
2. Add your Android/iOS apps to Firebase console
3. Download configuration files:
   - `google-services.json` for Android
   - `GoogleService-Info.plist` for iOS
4. Place files in appropriate directories:
   ```
   android/app/google-services.json
   ios/Runner/GoogleService-Info.plist
   ```

### Configure Authentication
```bash
flutter pub add firebase_auth
flutter pub add cloud_firestore
flutter pub add firebase_core
```

---

## 📂 Project Structure
```plaintext
lib/
├── auth/                      # Authentication features
│   ├── signin_screen.dart     # SignIn screen
│   ├── signup_screen.dart     # SignUp screen
│   └── auth_provider.dart     # Auth state management
├── widgets/                   # Reusable components
│   ├── gradient_button.dart
│   ├── password_field.dart
│   └── input_field.dart
├── services/                  # Backend services
│   ├── auth_service.dart      # Firebase auth service
│   └── database_service.dart  # Firestore service
├── utils/                     # Helper classes
│   ├── validators.dart        # Form validation
│   └── animations.dart        # Custom animations
├── firebase_options.dart      # Firebase config
└── main.dart                  # App entry point
```

---

## 🌟 Featured Animations
```dart
// Success animation
Lottie.asset(
  'assets/animations/success.json',
  width: 200,
  height: 200,
  repeat: false,
)
```

```dart
// Page transition
PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
),
```

---

## 🤝 Contributing
We welcome contributions! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License
Distributed under the MIT License. See `LICENSE` for more information.

---

## ✉️ Contact
Umer Jamshaid - [@UmerJamshaid](https://twitter.com/UmerJamshaid) - umer.jamshaid@example.com

Project Link: [https://github.com/Umerjamshaid/flutter-auth-suite](https://github.com/Umerjamshaid/flutter-auth-suite)

---

<div align="center">
  Made with ❤️ using Flutter | © 2025 Umer Jamshaid
</div>

```

## 🖼️ How to Add Screenshots

1. Create a `screenshots/` directory in your project root
2. Add your screenshots with these names:
   - `signin-screen.png`
   - `signup-screen.png`
   - `success-state.png`
3. Replace the placeholder URLs in the README with:
   ```markdown
   ![SignIn](screenshots/signin-screen.png)
   ![SignUp](screenshots/signup-screen.png)
   ![Success](screenshots/success-state.png)
   ```

## 💻 How to Implement

1. Save this as `README.md` in your project root
2. Customize sections with your specific details
3. Add actual screenshots when available
4. Update the tech versions to match your project
5. Push to GitHub:
```bash
git add README.md
git commit -m "Add professional README with animations and badges"
git push
```

This README features:
- Modern design with visual hierarchy
- Interactive badges and banners
- Animated GIF placeholders
- Code snippets for key widgets
- Clear installation instructions
- Visual project structure
- Contribution guidelines
- Social links and contact information

Your GitHub repository will now stand out and clearly communicate your project's value!
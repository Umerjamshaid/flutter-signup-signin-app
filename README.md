# 🔐 Flutter Auth Screens (SignIn & SignUp) with Firebase

![App Screenshot](/assets/screenshots/auth-screens.png) <!-- Add your screenshot path here -->

A modern Flutter authentication flow with Firebase integration, featuring sleek SignIn and SignUp screens with form validation.

## ✨ Features

- **Firebase Authentication**  
  - Email/password signup
  - Secure credential storage
- **Beautiful UI**  
  - Custom form fields with icons
  - Password visibility toggle
  - Responsive design
- **Form Validation**  
  - Real-time error checking
  - Password confirmation
- **Smooth Navigation**  
  - Between SignIn and SignUp screens
  - Loading indicators

## 🛠️ Technologies

- **Flutter** (v3.19.5)
- **Firebase**  
  - Firestore Database
  - Authentication
- **Dart** (v3.3.0)

## 📸 Screenshots

| SignIn Screen | SignUp Screen |
|---------------|---------------|
| ![SignIn](/assets/screenshots/signin.png) | ![SignUp](/assets/screenshots/signup.png) |

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- Firebase project (with Android/iOS config)

### Installation
1. Clone the repo:
   ```bash
   git clone https://github.com/Umerjamshaid/flutter-signup-signin-app.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Add your `google-services.json` (Android) or `GoogleService-Info.plist` (iOS)

### Firebase Setup
1. Enable Email/Password auth in Firebase Console
2. Add Firestore rules:
   ```rules
   service cloud.firestore {
     match /databases/{database}/documents {
       match /users/{userId} {
         allow read, write: if request.auth != null && request.auth.uid == userId;
       }
     }
   }
   ```

## 🎨 UI Components

```dart
// Example of styled TextField
TextField(
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
    hintText: "Email",
    prefixIcon: Icon(Icons.email, color: Colors.grey.shade500),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
)
```

## 📂 Project Structure

```
lib/
├── main.dart          # App entry point
├── SignIn.dart        # SignIn screen
├── SignUp.dart        # SignUp screen
├── firebase_options.dart # Firebase config
assets/
├── icons/             # Custom icons
├── images/            # App images
```

## 🤝 Contributing

Pull requests welcome! For major changes, please open an issue first.

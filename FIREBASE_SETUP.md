# Firebase Authentication Setup

This app now supports Google and Apple sign-in using Firebase Authentication. Follow these steps to complete the setup:

## 1. Firebase Project Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select an existing one
3. Enable Authentication in the Firebase Console
4. Go to Authentication > Sign-in method
5. Enable Google and Apple sign-in providers

## 2. Android Configuration

1. In Firebase Console, go to Project Settings > General
2. Add Android app with package name: `com.example.whisperfire`
3. Download `google-services.json` and place it in `android/app/`
4. Add the following to `android/app/build.gradle`:
   ```gradle
   dependencies {
       implementation 'com.google.gms:google-services:4.3.15'
   }
   ```
5. Add the following to `android/build.gradle`:
   ```gradle
   dependencies {
       classpath 'com.google.gms:google-services:4.3.15'
   }
   ```

## 3. iOS Configuration

1. In Firebase Console, add iOS app with bundle ID: `com.example.whisperfire`
2. Download `GoogleService-Info.plist` and place it in `ios/Runner/`
3. Add the following to `ios/Runner/Info.plist`:
   ```xml
   <key>CFBundleURLTypes</key>
   <array>
       <dict>
           <key>CFBundleURLName</key>
           <string>REVERSED_CLIENT_ID</string>
           <key>CFBundleURLSchemes</key>
           <array>
               <string>YOUR_REVERSED_CLIENT_ID</string>
           </array>
       </dict>
   </array>
   ```

## 4. Apple Sign-In Setup (iOS only)

1. In Firebase Console, configure Apple Sign-In provider
2. Add your Apple Developer Team ID
3. Create a Service ID in Apple Developer Console
4. Configure the Service ID with your domain and redirect URL

## 5. Generate Firebase Configuration

1. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. Run the configuration command:
   ```bash
   flutterfire configure
   ```

3. This will generate the proper `firebase_options.dart` file

## 6. Update Dependencies

Run the following command to install all dependencies:
```bash
flutter pub get
```

## 7. Testing

1. Run the app: `flutter run`
2. You should see the login page with Google and Apple sign-in options
3. Test both authentication methods

## Troubleshooting

- If Google sign-in fails, make sure you've added the correct SHA-1 fingerprint to Firebase Console
- If Apple sign-in fails, ensure you've configured the Service ID correctly
- For iOS, make sure you're testing on a physical device (Apple Sign-In doesn't work in simulator)

## Security Notes

- Never commit your `google-services.json` or `GoogleService-Info.plist` files to public repositories
- Add them to `.gitignore` if you're using version control
- Use different Firebase projects for development and production 
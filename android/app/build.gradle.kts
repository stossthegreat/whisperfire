// android/app/build.gradle.kts

import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Read version values the same way Flutter's Groovy template did.
// If local.properties doesn't have them (often git-ignored), we fall back to 1 / "1.0".
val localProps = Properties().apply {
    val f = rootProject.file("local.properties")
    if (f.exists()) f.inputStream().use { load(it) }
}
val flutterVersionCode = (localProps.getProperty("flutter.versionCode") ?: "1").toInt()
val flutterVersionName = localProps.getProperty("flutter.versionName") ?: "1.0"

android {
    namespace = "com.example.whisperfire"

    // Use explicit ints in KTS (don’t rely on flutter.compileSdkVersion in KTS)
    compileSdk = 34
    // If this line causes "unresolved reference", just delete it.
    // ndkVersion = flutter.ndkVersion

    defaultConfig {
        applicationId = "com.example.whisperfire"
        minSdk = 21
        targetSdk = 34

        // Kotlin DSL property assignments:
        versionCode = flutterVersionCode
        versionName = flutterVersionName
    }

    buildTypes {
        release {
            // Debug signing so you can build quickly; change later for Play release.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // AGP 8.x expects Java 17
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }
}

flutter {
    source = "../.."
}

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "Com.beguileai.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.beguileai.app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val ksPath = System.getenv("ANDROID_KEYSTORE_PATH") ?: "${project.rootDir}/android/app/keystore.jks"
            val ksPass = System.getenv("ANDROID_KEYSTORE_PASSWORD")
            val keyAlias = System.getenv("ANDROID_KEY_ALIAS")
            val keyPass = System.getenv("ANDROID_KEY_PASSWORD")
            storeFile = file(ksPath)
            storePassword = ksPass
            this.keyAlias = keyAlias
            keyPassword = keyPass
        }
    }

    buildTypes {
        release {
            // Use release signing if provided; otherwise fallback to debug
            signingConfig = if (
                System.getenv("ANDROID_KEYSTORE_PASSWORD") != null &&
                System.getenv("ANDROID_KEY_ALIAS") != null &&
                System.getenv("ANDROID_KEY_PASSWORD") != null
            ) signingConfigs.getByName("release") else signingConfigs.getByName("debug")
            isMinifyEnabled = false
            isShrinkResources = false
        }
        debug {
            signingConfig = signingConfigs.getByName("debug")
            isShrinkResources = false
        }
    }
}

flutter {
    source = "../.."
}

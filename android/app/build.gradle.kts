plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.beguileai.app"
    compileSdk = flutter.compileSdkVersion
    // ndkVersion = flutter.ndkVersion

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
            val ksEnv = System.getenv("ANDROID_KEYSTORE_PATH")
            val ksPath = if (!ksEnv.isNullOrBlank()) ksEnv else "${project.rootDir}/keystore.jks"
            val storePass = System.getenv("ANDROID_KEYSTORE_PASSWORD")
            val alias = System.getenv("ANDROID_KEY_ALIAS")

            storeFile = file(ksPath)
            storePassword = storePass
            this.keyAlias = alias
            // Use store password for key as well to avoid PKCS12 mismatch
            keyPassword = storePass
        }
    }

    buildTypes {
        release {
            val ksEnv = System.getenv("ANDROID_KEYSTORE_PATH")
            val ksPath = if (!ksEnv.isNullOrBlank()) ksEnv else "${project.rootDir}/keystore.jks"
            val hasKs = file(ksPath).exists() &&
                System.getenv("ANDROID_KEYSTORE_PASSWORD") != null &&
                System.getenv("ANDROID_KEY_ALIAS") != null

            signingConfig = if (hasKs) signingConfigs.getByName("release") else signingConfigs.getByName("debug")
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

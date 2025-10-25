# Keep Stripe SDK classes related to Push Provisioning
-keep class com.stripe.android.pushProvisioning.** { *; }
-dontwarn com.stripe.android.pushProvisioning.**

# React Native Stripe SDK (if used)
-keep class com.reactnativestripesdk.** { *; }
-dontwarn com.reactnativestripesdk.**

# Flutter and Dart reflection rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }

# Keep all enums
-keepclassmembers enum * { *; }

# Prevent removing Flutter generated classes
-keep class com.example.mon5majeur.** { *; }

# Ignore missing Google Play Core classes
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# Keep Flutter Play Store Split Application

-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
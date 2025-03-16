import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:tripmates/Auth_Screens/splash_screen.dart';
import 'package:tripmates/Constants/theme_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'Services/PushNotifications.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // User? user = FirebaseAuth.instance.currentUser;

  await FirebaseMessaging.instance.requestPermission();

  String? token = await FirebaseMessaging.instance.getToken();
  print("FCM Token: $token");

  // Initialize push notifications
  await PushNotificationService.initialize();


  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // navigation bar color
        statusBarColor: Colors.transparent, // status bar color
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(
            450,
            name: MOBILE,
          ),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeNotifier().darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeNotifier().lightTheme,
      home: SplashScreen(),
    );
  }
}

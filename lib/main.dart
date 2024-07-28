import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:rider_app/Screens/login_screen.dart';
// ignore: unused_import
import 'package:rider_app/Screens/main_screen.dart';
// ignore: unused_import
import 'package:rider_app/Screens/register_screen.dart';
import 'package:rider_app/SplashScreen/splash_screen.dart';
import 'package:rider_app/ThemeProvider/theme_provider.dart';
import 'package:rider_app/infohandler/app_info.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        
        ),
      );
    
  }
}


import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rider_app/Assistants/assistants_methods.dart';
import 'package:rider_app/Screens/login_screen.dart';
import 'package:rider_app/Screens/main_screen.dart';
import 'package:rider_app/global/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer(){
    Timer(Duration(seconds: 3),() async {
      if(await firebaseAuth.currentUser!=null){
        firebaseAuth.currentUser!=null ? AssistantMethods.readCurrentOnlineUserInfo():null;
        Navigator.push(context, MaterialPageRoute(builder: (c)=>MainScreen()));

      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
        'Rido',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold
        ),
      ),
      ),
    );
  }
}
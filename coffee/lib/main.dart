import 'package:coffee_shop/screens/detailscreen.dart';
import 'package:coffee_shop/screens/forgotPassword.dart';
import 'package:coffee_shop/screens/helpandsupport.dart';
import 'package:coffee_shop/screens/option.dart';

import 'package:coffee_shop/services/notification_service.dart';
import 'package:coffee_shop/screens/order_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:coffee_shop/screens/dashboard.dart';
import 'package:coffee_shop/screens/login.dart';
import 'package:coffee_shop/screens/register.dart';
import 'package:coffee_shop/screens/welcomescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  NotificationService.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee-Shop',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/welcomescreen",
      routes: {
        "/login": (BuildContext context) => LoginScreen(),
        "/register": (BuildContext context) => RegisterWidget(),
        "/welcomescreen": (BuildContext context) => WelcomeScreen(),
        "/dashboard": (BuildContext context) => HomePage(),
        "/forgotPassword": (BuildContext context) => ForgotPassword(),
        "/helpandsupport": (BuildContext context) => HelpAndSupport(),
        "/more": (BuildContext context) => Option(),
      },
    );
  }
}

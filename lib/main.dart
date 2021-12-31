import 'package:flutter/material.dart';
import 'package:flutter_laravel/MyHistoryfulWidget.dart';
import 'package:flutter_laravel/onboarding/Fonboarding.dart';
import 'package:flutter_laravel/screens/WashMan.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/reserver.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Res()),
        ChangeNotifierProvider(create: (context) => Serv()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Washing cars',
      //     home: OnBoarding(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

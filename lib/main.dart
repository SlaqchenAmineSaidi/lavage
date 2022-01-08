import 'package:flutter/material.dart';
import 'package:flutter_laravel/location.dart';
import 'package:flutter_laravel/screens/history/MyHistoryfulWidget.dart';
import 'package:flutter_laravel/maps.dart';
import 'package:flutter_laravel/onboarding/Fonboarding.dart';
import 'package:flutter_laravel/screens/WashMan.dart';
import 'package:flutter_laravel/screens/history/Reviews.dart';
import 'package:flutter_laravel/screens/history/DetailScreen.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/screens/history/DetailScreen.dart';
import 'package:flutter_laravel/services/Wash.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/reserver.dart';
import 'package:flutter_laravel/services/service.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Res()),
        ChangeNotifierProvider(create: (context) => Serv()),
        ChangeNotifierProvider(create: (context) => Wash()),
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
      home: OnBoarding(),
      //home: DetailScreen(),
      //home: SalonsScreen(),
      //home: MapScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

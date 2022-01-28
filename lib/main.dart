import 'package:flutter/material.dart';
import 'package:flutter_laravel/Apk_services/Book_services.dart';
import 'package:flutter_laravel/Apk_services/Wash_services.dart';
import 'package:flutter_laravel/Apk_services/services.dart';
import 'package:flutter_laravel/location.dart';
import 'package:flutter_laravel/models/service.dart';
import 'package:flutter_laravel/screens/history/MyHistoryfulWidget.dart';
import 'package:flutter_laravel/maps.dart';
import 'package:flutter_laravel/onboarding/Fonboarding.dart';
import 'package:flutter_laravel/screens/WashMan.dart';
import 'package:flutter_laravel/screens/history/Reviews.dart';
import 'package:flutter_laravel/screens/history/DetailScreen.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:flutter_laravel/screens/history/DetailScreen.dart';
import 'package:flutter_laravel/services/Wash.dart';
import 'package:flutter_laravel/services/adresse.dart';
import 'package:flutter_laravel/services/auth.dart';
import 'package:flutter_laravel/services/comment.dart';
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
        ChangeNotifierProvider(create: (context) => Adre()),
        ChangeNotifierProvider(create: (context) => Com()),
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
      //home: location(),
      //home: service(),
      debugShowCheckedModeBanner: false,
    );
  }
}

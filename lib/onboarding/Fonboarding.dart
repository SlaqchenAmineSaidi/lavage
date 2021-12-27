import 'package:flutter/material.dart';
import 'package:flutter_laravel/onboarding/OnBoardingPage.dart';
import 'package:flutter_laravel/screens/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) => SafeArea(
          child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Deep Cleaning',
            body:
                'To Be As Clean As A Hound’s Tooth. As promised, we are going to do a good job ',
            image: buildImage('images/l.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Good Service',
            body:
                'Feel Full Of The Joys Of Spring. Don\'t even hesitate, just try first',
            image: buildImage('images/logii.jpg'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Fast Work',
            body:
                'As Quick As a Flash, As Quick As Lightning. We try to offer the fast deep cleaning, just trust us ',
            image: buildImage('images/lll.png'),
            decoration: getPageDecoration(),
            footer: ButtonWidget(
              text: 'Start the application',
              onClicked: () => goToHome(context),
            ),
          ),
        ],
        done: const Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: const Text('Skip'),
        onSkip: () => goToHome(context),
        next: const Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: Theme.of(context).primaryColor,
        skipFlex: 0,
        nextFlex: 0,
      ));
  Widget buildImage(String path) => Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(path),
          radius: 200,
        ),
      );
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: const TextStyle(fontSize: 20),
        descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/src/data/responses/search_ip_response.dart';
import 'package:weather/src/services/api_controller.dart';
import 'package:weather/src/utils/data.dart';
import 'package:weather/src/utils/helpers.dart';
import 'package:weather/src/utils/theme.dart';
import 'package:weather/src/views/home_views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        Data.navigator,
      ],
      theme: getLightTheme(context),
      scrollBehavior: const CupertinoScrollBehavior(),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future afterSplash() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    try {
      City response = await ApiController.searchIpAddress();
      Data.ipData = response;
      N.pushReplacement(context, HomePage());
    } on Exception catch (e) {


    }
  }

  @override
  void initState() {
    afterSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlue,
      body: Center(
        child: Lottie.asset(
          'assets/lottie/weather-icon.json',
          repeat: false,
        ),
      ),
    );
  }
}

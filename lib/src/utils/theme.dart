import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

ThemeData getLightTheme(BuildContext context) => ThemeData(
      primarySwatch: MaterialColor(0xffd71e3d, {
        50: kDarkBlue,
        100: kDarkBlue,
        200: kDarkBlue,
        300: kDarkBlue,
        400: kDarkBlue,
        500: kDarkBlue,
        600: kDarkBlue,
        700: kDarkBlue,
        800: kDarkBlue,
        900: kDarkBlue,
      }),
      backgroundColor: kBackgroundColor,
      scaffoldBackgroundColor: kBackgroundColor,
      primaryColor: kGreen,
      colorScheme: ColorScheme.light(primary: kGreen),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      }),

      cupertinoOverrideTheme: NoDefaultCupertinoThemeData().copyWith(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle().copyWith(
            fontFamily: 'UltimaPro',
          ),
        ),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.white),
      // primaryColor: kPrimary,
      fontFamily: 'UltimaPro',
      radioTheme:
          RadioThemeData(fillColor: MaterialStateProperty.all(kDarkBlue)),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: kDarkBlue,
        elevation: 0,
        centerTitle: true,
        shadowColor: Color(0x0d000000),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'UltimaPro',
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          fontSize: 14.0,
          color: const Color(0xFFDDDDDD),
          fontWeight: FontWeight.w300,
        ),
        errorStyle: TextStyle(
            fontSize: 12, color: Colors.red, fontWeight: FontWeight.w800),
        contentPadding: EdgeInsets.symmetric(horizontal: 22),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );

Color kDarkBlue = const Color(0xff093a5a);
Color kBlue = const Color(0xff006499);
Color kVeryDarkGreen = const Color(0xff0B5A54);
Color kDarkGreen = const Color(0xff26847D);
Color kGreen = const Color(0xff62AF31);
Color kRed = const Color(0xffAF3131);
Color kGrey = const Color(0xff505153);
Color kBackgroundColor = const Color(0xffEBF9FF);

Color kBorderColor = const Color(0xffe5e5e5);

BoxShadow kBoxShadow = BoxShadow(
  color: const Color(0x29000000),
  offset: Offset(0, 0),
  blurRadius: 12,
);

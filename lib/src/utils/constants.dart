import 'package:flutter/material.dart';
import 'data.dart';

class Constants {
  static const String locationUrl = 'http://dataservice.accuweather.com/locations/v1/';
  static const String forecastUrl = 'http://dataservice.accuweather.com/forecasts/v1/';

  static const String ApiKey = 'apikey=ncjYGy7GXaVAGhXN64BAYXsArAkpuGkx';


  static const en = Locale(
    'en',
  );
  static const ar = Locale(
    'ar',
  );
  static const emailRegExp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const kPadding = EdgeInsets.symmetric(horizontal: 23.5);


  static InputDecoration inputDecoration(
      {String hint,
        Widget suffix,
        Widget prefix,
        Color color,
        EdgeInsets padding,
        TextStyle hintStyle}) {
    return InputDecoration(
        contentPadding: padding,
        suffixIcon: suffix,
        suffixIconConstraints: BoxConstraints(minWidth: 70),
        prefixIcon: prefix,
        prefixIconConstraints: BoxConstraints(minWidth: 70),
        hintText: hint,
        hintStyle: hintStyle,
        fillColor: color);
  }

}



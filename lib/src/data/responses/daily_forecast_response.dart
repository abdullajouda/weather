// To parse this JSON data, do
//
//     final dailyForecastResponse = dailyForecastResponseFromJson(jsonString);

import 'dart:convert';

import '../models/headline.dart';

DailyForecastResponse dailyForecastResponseFromJson(String str) => DailyForecastResponse.fromJson(json.decode(str));

String dailyForecastResponseToJson(DailyForecastResponse data) => json.encode(data.toJson());

class DailyForecastResponse {
  Headline headline;
  List<DailyForecast> dailyForecasts;

  DailyForecastResponse({
    this.headline,
    this.dailyForecasts,
  });

  factory DailyForecastResponse.fromJson(Map<String, dynamic> json) => DailyForecastResponse(
    headline: Headline.fromJson(json["Headline"]),
    dailyForecasts: List<DailyForecast>.from(json["DailyForecasts"].map((x) => DailyForecast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Headline": headline.toJson(),
    "DailyForecasts": List<dynamic>.from(dailyForecasts.map((x) => x.toJson())),
  };
}

class DailyForecast {
  DateTime date;
  int epochDate;
  Temperature temperature;
  Day day;
  Day night;
  List<String> sources;
  String mobileLink;
  String link;

  DailyForecast({
    this.date,
    this.epochDate,
    this.temperature,
    this.day,
    this.night,
    this.sources,
    this.mobileLink,
    this.link,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
    date: DateTime.parse(json["Date"]),
    epochDate: json["EpochDate"],
    temperature: Temperature.fromJson(json["Temperature"]),
    day: Day.fromJson(json["Day"]),
    night: Day.fromJson(json["Night"]),
    sources: List<String>.from(json["Sources"].map((x) => x)),
    mobileLink: json["MobileLink"],
    link: json["Link"],
  );

  Map<String, dynamic> toJson() => {
    "Date": date.toIso8601String(),
    "EpochDate": epochDate,
    "Temperature": temperature.toJson(),
    "Day": day.toJson(),
    "Night": night.toJson(),
    "Sources": List<dynamic>.from(sources.map((x) => x)),
    "MobileLink": mobileLink,
    "Link": link,
  };
}

class Day {
  int icon;
  String iconPhrase;
  bool hasPrecipitation;

  Day({
    this.icon,
    this.iconPhrase,
    this.hasPrecipitation,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    icon: json["Icon"],
    iconPhrase: json["IconPhrase"],
    hasPrecipitation: json["HasPrecipitation"],
  );

  Map<String, dynamic> toJson() => {
    "Icon": icon,
    "IconPhrase": iconPhrase,
    "HasPrecipitation": hasPrecipitation,
  };
}

class Temperature {
  Imum minimum;
  Imum maximum;

  Temperature({
    this.minimum,
    this.maximum,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
    minimum: Imum.fromJson(json["Minimum"]),
    maximum: Imum.fromJson(json["Maximum"]),
  );

  Map<String, dynamic> toJson() => {
    "Minimum": minimum.toJson(),
    "Maximum": maximum.toJson(),
  };
}

class Imum {
  double value;
  String unit;
  String unitType;

  Imum({
    this.value,
    this.unit,
    this.unitType,
  });

  factory Imum.fromJson(Map<String, dynamic> json) => Imum(
    value: double.parse(json["Value"].toString()),
    unit: json["Unit"],
    unitType: json["UnitType"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "Value": value,
    "Unit": unit,
    "UnitType": unitType,
  };
}


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:weather/src/data/models/admin_area.dart';
import 'package:weather/src/data/responses/daily_forecast_response.dart';
import 'package:weather/src/utils/data.dart';

import '../data/responses/search_ip_response.dart';
import '../utils/constants.dart';

class ApiController {
  //Returns basic information about administrative areas in the specified country.
  static Future<List<AdministrativeArea>> getAdminAreaList(
      {@required String country}) async {
    var request = await get(Uri.parse(
        "${Constants.locationUrl}adminareas/$country?${Constants.ApiKey}"));

    return adminAreasResponseFromJson(json.decode(request.body));
  }

  //Returns information about a specific location, by IP Address.
  static Future<City> searchIpAddress() async {
    var request = await get(
      Uri.parse("${Constants.locationUrl}cities/ipaddress?${Constants.ApiKey}"),
    );
    print(request.body);

    return City.fromJson(json.decode(request.body));
  }

  //Search for information about a specific city by text.

  static Future<List<City>> searchCities({String term}) async {
    var request = await get(
      Uri.parse(
          "${Constants.locationUrl}cities/search?${Constants.ApiKey}&q=${term}"),
    );

    print(request.body);
    return searchCitiesResponseFromJson(request.body);
  }

  //Returns daily forecast data for a specific location.
  static Future<DailyForecastResponse> dailyForecast(
      {int days = 1, String location_key}) async {
    var request = await get(
      Uri.parse(
          "${Constants.forecastUrl}daily/${days}day/${location_key ?? Data.location_key}?${Constants.ApiKey}"),
    );
    print(request.body);
    return DailyForecastResponse.fromJson(json.decode(request.body));
  }
}

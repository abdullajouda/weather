// To parse this JSON data, do
//
//     final searchIpResponse = searchIpResponseFromJson(jsonString);

import 'dart:convert';

import '../models/admin_area.dart';
import '../models/country.dart';
import '../models/geo_position.dart';
import '../models/time_zone.dart';

List<City> searchCitiesResponseFromJson(String str) => List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

City searchIpResponseFromJson(String str) => City.fromJson(json.decode(str));

String searchIpResponseToJson(City data) => json.encode(data.toJson());

class City {
  int version;
  String key;
  String type;
  int rank;
  String localizedName;
  String englishName;
  String primaryPostalCode;
  Country region;
  Country country;
  AdministrativeArea administrativeArea;
  TimeZone timeZone;
  GeoPosition geoPosition;
  bool isAlias;
  List<SupplementalAdminArea> supplementalAdminAreas;
  List<String> dataSets;

  City({
    this.version,
    this.key,
    this.type,
    this.rank,
    this.localizedName,
    this.englishName,
    this.primaryPostalCode,
    this.region,
    this.country,
    this.administrativeArea,
    this.timeZone,
    this.geoPosition,
    this.isAlias,
    this.supplementalAdminAreas,
    this.dataSets,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    version: json["Version"],
    key: json["Key"],
    type: json["Type"],
    rank: json["Rank"],
    localizedName: json["LocalizedName"],
    englishName: json["EnglishName"],
    primaryPostalCode: json["PrimaryPostalCode"],
    region: Country.fromJson(json["Region"]),
    country: Country.fromJson(json["Country"]),
    administrativeArea: AdministrativeArea.fromJson(json["AdministrativeArea"]),
    timeZone: TimeZone.fromJson(json["TimeZone"]),
    geoPosition: GeoPosition.fromJson(json["GeoPosition"]),
    isAlias: json["IsAlias"],
    supplementalAdminAreas: List<SupplementalAdminArea>.from(json["SupplementalAdminAreas"].map((x) => SupplementalAdminArea.fromJson(x))),
    dataSets: List<String>.from(json["DataSets"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Version": version,
    "Key": key,
    "Type": type,
    "Rank": rank,
    "LocalizedName": localizedName,
    "EnglishName": englishName,
    "PrimaryPostalCode": primaryPostalCode,
    "Region": region.toJson(),
    "Country": country.toJson(),
    "AdministrativeArea": administrativeArea.toJson(),
    "TimeZone": timeZone.toJson(),
    "GeoPosition": geoPosition.toJson(),
    "IsAlias": isAlias,
    "SupplementalAdminAreas": List<dynamic>.from(supplementalAdminAreas.map((x) => x.toJson())),
    "DataSets": List<dynamic>.from(dataSets.map((x) => x)),
  };
}








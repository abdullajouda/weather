import 'dart:convert';



List<AdministrativeArea> adminAreasResponseFromJson(String str) => List<AdministrativeArea>.from(json.decode(str).map((x) => AdministrativeArea.fromJson(x)));

class AdministrativeArea {
  String id;
  String localizedName;
  String englishName;
  int level;
  String localizedType;
  String englishType;
  String countryId;

  AdministrativeArea({
    this.id,
    this.localizedName,
    this.englishName,
    this.level,
    this.localizedType,
    this.englishType,
    this.countryId,
  });

  factory AdministrativeArea.fromJson(Map<String, dynamic> json) => AdministrativeArea(
    id: json["ID"],
    localizedName: json["LocalizedName"],
    englishName: json["EnglishName"],
    level: json["Level"],
    localizedType: json["LocalizedType"],
    englishType: json["EnglishType"],
    countryId: json["CountryID"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "LocalizedName": localizedName,
    "EnglishName": englishName,
    "Level": level,
    "LocalizedType": localizedType,
    "EnglishType": englishType,
    "CountryID": countryId,
  };
}

class SupplementalAdminArea {
  int level;
  String localizedName;
  String englishName;

  SupplementalAdminArea({
    this.level,
    this.localizedName,
    this.englishName,
  });

  factory SupplementalAdminArea.fromJson(Map<String, dynamic> json) => SupplementalAdminArea(
    level: json["Level"],
    localizedName: json["LocalizedName"],
    englishName: json["EnglishName"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "LocalizedName": localizedName,
    "EnglishName": englishName,
  };
}

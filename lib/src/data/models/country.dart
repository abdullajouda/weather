class Country {
  String id;
  String localizedName;
  String englishName;

  Country({
    this.id,
    this.localizedName,
    this.englishName,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["ID"],
    localizedName: json["LocalizedName"],
    englishName: json["EnglishName"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "LocalizedName": localizedName,
    "EnglishName": englishName,
  };
}

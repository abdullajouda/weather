class TimeZone {
  String code;
  String name;
  double gmtOffset;
  bool isDaylightSaving;
  DateTime nextOffsetChange;

  TimeZone({
    this.code,
    this.name,
    this.gmtOffset,
    this.isDaylightSaving,
    this.nextOffsetChange,
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) => TimeZone(
    code: json["Code"],
    name: json["Name"],
    gmtOffset: double.parse(json["GmtOffset"].toString()),
    isDaylightSaving: json["IsDaylightSaving"],
    nextOffsetChange:json["NextOffsetChange"]==null?null: DateTime.parse(json["NextOffsetChange"]),
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "Name": name,
    "GmtOffset": gmtOffset,
    "IsDaylightSaving": isDaylightSaving,
    "NextOffsetChange": nextOffsetChange.toIso8601String(),
  };
}

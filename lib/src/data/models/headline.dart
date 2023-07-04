class Headline {
  DateTime effectiveDate;
  int effectiveEpochDate;
  int severity;
  String text;
  String category;
  dynamic endDate;
  dynamic endEpochDate;
  String mobileLink;
  String link;

  Headline({
    this.effectiveDate,
    this.effectiveEpochDate,
    this.severity,
    this.text,
    this.category,
    this.endDate,
    this.endEpochDate,
    this.mobileLink,
    this.link,
  });

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
    effectiveDate: DateTime.parse(json["EffectiveDate"]),
    effectiveEpochDate: json["EffectiveEpochDate"],
    severity: json["Severity"],
    text: json["Text"],
    category: json["Category"],
    endDate: json["EndDate"],
    endEpochDate: json["EndEpochDate"],
    mobileLink: json["MobileLink"],
    link: json["Link"],
  );

  Map<String, dynamic> toJson() => {
    "EffectiveDate": effectiveDate.toIso8601String(),
    "EffectiveEpochDate": effectiveEpochDate,
    "Severity": severity,
    "Text": text,
    "Category": category,
    "EndDate": endDate,
    "EndEpochDate": endEpochDate,
    "MobileLink": mobileLink,
    "Link": link,
  };
}

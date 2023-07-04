class GeoPosition {
  double latitude;
  double longitude;
  Elevation elevation;

  GeoPosition({
    this.latitude,
    this.longitude,
    this.elevation,
  });

  factory GeoPosition.fromJson(Map<String, dynamic> json) => GeoPosition(
    latitude: json["Latitude"].toDouble(),
    longitude: json["Longitude"].toDouble(),
    elevation: Elevation.fromJson(json["Elevation"]),
  );

  Map<String, dynamic> toJson() => {
    "Latitude": latitude,
    "Longitude": longitude,
    "Elevation": elevation.toJson(),
  };
}
class Elevation {
  Imperial metric;
  Imperial imperial;

  Elevation({
    this.metric,
    this.imperial,
  });

  factory Elevation.fromJson(Map<String, dynamic> json) => Elevation(
    metric: Imperial.fromJson(json["Metric"]),
    imperial: Imperial.fromJson(json["Imperial"]),
  );

  Map<String, dynamic> toJson() => {
    "Metric": metric.toJson(),
    "Imperial": imperial.toJson(),
  };
}
class Imperial {
  String value;
  String unit;
  String unitType;

  Imperial({
    this.value,
    this.unit,
    this.unitType,
  });

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
    value: json["Value"].toString(),
    unit: json["Unit"],
    unitType: json["UnitType"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "Value": value,
    "Unit": unit,
    "UnitType": unitType,
  };
}

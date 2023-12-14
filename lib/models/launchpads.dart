// To parse this JSON data, do
//
//     final lauchpad = lauchpadFromJson(jsonString);

import 'dart:convert';

Lauchpad lauchpadFromJson(String str) => Lauchpad.fromJson(json.decode(str));

String lauchpadToJson(Lauchpad data) => json.encode(data.toJson());

class Lauchpad {
  Images? images;
  String? name;
  String? fullName;
  String? locality;
  String? region;
  double? latitude;
  double? longitude;
  int? launchAttempts;
  int? launchSuccesses;
  List<String>? rockets;
  String? timezone;
  List<String>? launches;
  String? status;
  String? details;
  String? id;

  Lauchpad({
    this.images,
    this.name,
    this.fullName,
    this.locality,
    this.region,
    this.latitude,
    this.longitude,
    this.launchAttempts,
    this.launchSuccesses,
    this.rockets,
    this.timezone,
    this.launches,
    this.status,
    this.details,
    this.id,
  });

  factory Lauchpad.fromJson(Map<String, dynamic> json) => Lauchpad(
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        name: json["name"],
        fullName: json["full_name"],
        locality: json["locality"],
        region: json["region"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        launchAttempts: json["launch_attempts"],
        launchSuccesses: json["launch_successes"],
        rockets: json["rockets"] == null
            ? []
            : List<String>.from(json["rockets"]!.map((x) => x)),
        timezone: json["timezone"],
        launches: json["launches"] == null
            ? []
            : List<String>.from(json["launches"]!.map((x) => x)),
        status: json["status"],
        details: json["details"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "images": images?.toJson(),
        "name": name,
        "full_name": fullName,
        "locality": locality,
        "region": region,
        "latitude": latitude,
        "longitude": longitude,
        "launch_attempts": launchAttempts,
        "launch_successes": launchSuccesses,
        "rockets":
            rockets == null ? [] : List<dynamic>.from(rockets!.map((x) => x)),
        "timezone": timezone,
        "launches":
            launches == null ? [] : List<dynamic>.from(launches!.map((x) => x)),
        "status": status,
        "details": details,
        "id": id,
      };
}

class Images {
  List<String>? large;

  Images({
    this.large,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        large: json["large"] == null
            ? []
            : List<String>.from(json["large"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "large": large == null ? [] : List<dynamic>.from(large!.map((x) => x)),
      };
}

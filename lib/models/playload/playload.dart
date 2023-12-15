// To parse this JSON data, do
//
//     final playload = playloadFromJson(jsonString);

import 'dart:convert';

Playload playloadFromJson(String str) => Playload.fromJson(json.decode(str));

String playloadToJson(Playload data) => json.encode(data.toJson());

class Playload {
  Dragon? dragon;
  String? name;
  String? type;
  bool? reused;
  String? launch;
  List<String>? customers;
  List<int>? noradIds;
  List<String>? nationalities;
  List<String>? manufacturers;
  int? massKg;
  double? massLbs;
  String? orbit;
  String? referenceSystem;
  String? regime;
  dynamic longitude;
  double? semiMajorAxisKm;
  double? eccentricity;
  double? periapsisKm;
  double? apoapsisKm;
  double? inclinationDeg;
  double? periodMin;
  dynamic lifespanYears;
  DateTime? epoch;
  double? meanMotion;
  double? raan;
  double? argOfPericenter;
  double? meanAnomaly;
  String? id;

  Playload({
    this.dragon,
    this.name,
    this.type,
    this.reused,
    this.launch,
    this.customers,
    this.noradIds,
    this.nationalities,
    this.manufacturers,
    this.massKg,
    this.massLbs,
    this.orbit,
    this.referenceSystem,
    this.regime,
    this.longitude,
    this.semiMajorAxisKm,
    this.eccentricity,
    this.periapsisKm,
    this.apoapsisKm,
    this.inclinationDeg,
    this.periodMin,
    this.lifespanYears,
    this.epoch,
    this.meanMotion,
    this.raan,
    this.argOfPericenter,
    this.meanAnomaly,
    this.id,
  });

  factory Playload.fromJson(Map<String, dynamic> json) => Playload(
        dragon: json["dragon"] == null ? null : Dragon.fromJson(json["dragon"]),
        name: json["name"],
        type: json["type"],
        reused: json["reused"],
        launch: json["launch"],
        customers: json["customers"] == null
            ? []
            : List<String>.from(json["customers"]!.map((x) => x)),
        noradIds: json["norad_ids"] == null
            ? []
            : List<int>.from(json["norad_ids"]!.map((x) => x)),
        nationalities: json["nationalities"] == null
            ? []
            : List<String>.from(json["nationalities"]!.map((x) => x)),
        manufacturers: json["manufacturers"] == null
            ? []
            : List<String>.from(json["manufacturers"]!.map((x) => x)),
        massKg: json["mass_kg"],
        massLbs: json["mass_lbs"]?.toDouble(),
        orbit: json["orbit"],
        referenceSystem: json["reference_system"],
        regime: json["regime"],
        longitude: json["longitude"],
        semiMajorAxisKm: json["semi_major_axis_km"]?.toDouble(),
        eccentricity: json["eccentricity"]?.toDouble(),
        periapsisKm: json["periapsis_km"]?.toDouble(),
        apoapsisKm: json["apoapsis_km"]?.toDouble(),
        inclinationDeg: json["inclination_deg"]?.toDouble(),
        periodMin: json["period_min"]?.toDouble(),
        lifespanYears: json["lifespan_years"],
        epoch: json["epoch"] == null ? null : DateTime.parse(json["epoch"]),
        meanMotion: json["mean_motion"]?.toDouble(),
        raan: json["raan"]?.toDouble(),
        argOfPericenter: json["arg_of_pericenter"]?.toDouble(),
        meanAnomaly: json["mean_anomaly"]?.toDouble(),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "dragon": dragon?.toJson(),
        "name": name,
        "type": type,
        "reused": reused,
        "launch": launch,
        "customers": customers == null
            ? []
            : List<dynamic>.from(customers!.map((x) => x)),
        "norad_ids":
            noradIds == null ? [] : List<dynamic>.from(noradIds!.map((x) => x)),
        "nationalities": nationalities == null
            ? []
            : List<dynamic>.from(nationalities!.map((x) => x)),
        "manufacturers": manufacturers == null
            ? []
            : List<dynamic>.from(manufacturers!.map((x) => x)),
        "mass_kg": massKg,
        "mass_lbs": massLbs,
        "orbit": orbit,
        "reference_system": referenceSystem,
        "regime": regime,
        "longitude": longitude,
        "semi_major_axis_km": semiMajorAxisKm,
        "eccentricity": eccentricity,
        "periapsis_km": periapsisKm,
        "apoapsis_km": apoapsisKm,
        "inclination_deg": inclinationDeg,
        "period_min": periodMin,
        "lifespan_years": lifespanYears,
        "epoch": epoch?.toIso8601String(),
        "mean_motion": meanMotion,
        "raan": raan,
        "arg_of_pericenter": argOfPericenter,
        "mean_anomaly": meanAnomaly,
        "id": id,
      };
}

class Dragon {
  String? capsule;
  int? massReturnedKg;
  double? massReturnedLbs;
  int? flightTimeSec;
  dynamic manifest;
  bool? waterLanding;
  bool? landLanding;

  Dragon({
    this.capsule,
    this.massReturnedKg,
    this.massReturnedLbs,
    this.flightTimeSec,
    this.manifest,
    this.waterLanding,
    this.landLanding,
  });

  factory Dragon.fromJson(Map<String, dynamic> json) => Dragon(
        capsule: json["capsule"],
        massReturnedKg: json["mass_returned_kg"],
        massReturnedLbs: json["mass_returned_lbs"]?.toDouble(),
        flightTimeSec: json["flight_time_sec"],
        manifest: json["manifest"],
        waterLanding: json["water_landing"],
        landLanding: json["land_landing"],
      );

  Map<String, dynamic> toJson() => {
        "capsule": capsule,
        "mass_returned_kg": massReturnedKg,
        "mass_returned_lbs": massReturnedLbs,
        "flight_time_sec": flightTimeSec,
        "manifest": manifest,
        "water_landing": waterLanding,
        "land_landing": landLanding,
      };
}

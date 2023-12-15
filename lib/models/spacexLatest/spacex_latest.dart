// To parse this JSON data, do
//
//     final spacexLatest = spacexLatestFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_counter/models/core/core.dart';
import 'package:flutter_counter/models/crew/crew.dart';
import 'package:flutter_counter/models/links/links.dart';

SpacexLatest spacexLatestFromJson(String str) =>
    SpacexLatest.fromJson(json.decode(str));

String spacexLatestToJson(SpacexLatest data) => json.encode(data.toJson());

class SpacexLatest {
  dynamic fairings;
  Links? links;
  dynamic staticFireDateUtc;
  dynamic staticFireDateUnix;
  bool? net;
  dynamic window;
  String? rocket;
  bool? success;
  List<dynamic>? failures;
  dynamic details;
  List<Crew>? crew;
  List<dynamic>? ships;
  List<String>? capsules;
  List<String>? payloads;
  String? launchpad;
  int? flightNumber;
  String? name;
  DateTime? dateUtc;
  int? dateUnix;
  DateTime? dateLocal;
  String? datePrecision;
  bool? upcoming;
  List<Core>? cores;
  bool? autoUpdate;
  bool? tbd;
  String? launchLibraryId;
  String? id;

  SpacexLatest({
    this.fairings,
    this.links,
    this.staticFireDateUtc,
    this.staticFireDateUnix,
    this.net,
    this.window,
    this.rocket,
    this.success,
    this.failures,
    this.details,
    this.crew,
    this.ships,
    this.capsules,
    this.payloads,
    this.launchpad,
    this.flightNumber,
    this.name,
    this.dateUtc,
    this.dateUnix,
    this.dateLocal,
    this.datePrecision,
    this.upcoming,
    this.cores,
    this.autoUpdate,
    this.tbd,
    this.launchLibraryId,
    this.id,
  });

  factory SpacexLatest.fromJson(Map<String, dynamic> json) => SpacexLatest(
        fairings: json["fairings"],
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"],
        staticFireDateUnix: json["static_fire_date_unix"],
        net: json["net"],
        window: json["window"],
        rocket: json["rocket"],
        success: json["success"],
        failures: json["failures"] == null
            ? []
            : List<dynamic>.from(json["failures"]!.map((x) => x)),
        details: json["details"],
        // crew: json["crew"] == null
        //     ? []
        //     : List<Crew>.from(json["crew"]!.map((x) => Crew.fromJson(x))),

        ships: json["ships"] == null
            ? []
            : List<dynamic>.from(json["ships"]!.map((x) => x)),
        capsules: json["capsules"] == null
            ? []
            : List<String>.from(json["capsules"]!.map((x) => x)),
        payloads: json["payloads"] == null
            ? []
            : List<String>.from(json["payloads"]!.map((x) => x)),
        launchpad: json["launchpad"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc:
            json["date_utc"] == null ? null : DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: json["date_local"] == null
            ? null
            : DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: json["cores"] == null
            ? []
            : List<Core>.from(json["cores"]!.map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        launchLibraryId: json["launch_library_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fairings": fairings,
        "links": links?.toJson(),
        "static_fire_date_utc": staticFireDateUtc,
        "static_fire_date_unix": staticFireDateUnix,
        "net": net,
        "window": window,
        "rocket": rocket,
        "success": success,
        "failures":
            failures == null ? [] : List<dynamic>.from(failures!.map((x) => x)),
        "details": details,
        "crew": crew == null
            ? []
            : List<dynamic>.from(crew!.map((x) => x.toJson())),
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
        "capsules":
            capsules == null ? [] : List<dynamic>.from(capsules!.map((x) => x)),
        "payloads":
            payloads == null ? [] : List<dynamic>.from(payloads!.map((x) => x)),
        "launchpad": launchpad,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc?.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal?.toIso8601String(),
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": cores == null
            ? []
            : List<dynamic>.from(cores!.map((x) => x.toJson())),
        "auto_update": autoUpdate,
        "tbd": tbd,
        "launch_library_id": launchLibraryId,
        "id": id,
      };
}

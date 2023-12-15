// class Crew {
//   String? crew;
//   String? role;

//   Crew({
//     this.crew,
//     this.role,
//   });

//   factory Crew.fromJson(Map<String, dynamic> json) => Crew(
//         crew: json["crew"],
//         role: json["role"],
//       );

//   Map<String, dynamic> toJson() => {
//         "crew": crew,
//         "role": role,
//       };
// }

// To parse this JSON data, do
//
//     final crew = crewFromJson(jsonString);

import 'dart:convert';

Crew crewFromJson(String str) => Crew.fromJson(json.decode(str));

String crewToJson(Crew data) => json.encode(data.toJson());

class Crew {
  String? name;
  String? agency;
  String? image;
  String? wikipedia;
  List<String>? launches;
  String? status;
  String? id;

  Crew({
    this.name,
    this.agency,
    this.image,
    this.wikipedia,
    this.launches,
    this.status,
    this.id,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        name: json["name"],
        agency: json["agency"],
        image: json["image"],
        wikipedia: json["wikipedia"],
        launches: json["launches"] == null
            ? []
            : List<String>.from(json["launches"]!.map((x) => x)),
        status: json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "agency": agency,
        "image": image,
        "wikipedia": wikipedia,
        "launches":
            launches == null ? [] : List<dynamic>.from(launches!.map((x) => x)),
        "status": status,
        "id": id,
      };
}

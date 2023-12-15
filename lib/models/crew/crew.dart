class Crew {
  String? crew;
  String? role;

  Crew({
    this.crew,
    this.role,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        crew: json["crew"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "crew": crew,
        "role": role,
      };
}

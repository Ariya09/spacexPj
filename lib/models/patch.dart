class Patch {
  String? small;
  String? large;

  Patch({
    this.small,
    this.large,
  });

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
      };
}

class Flickr {
  List<dynamic>? small;
  List<dynamic>? original;

  Flickr({
    this.small,
    this.original,
  });

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: json["small"] == null
            ? []
            : List<dynamic>.from(json["small"]!.map((x) => x)),
        original: json["original"] == null
            ? []
            : List<dynamic>.from(json["original"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "small": small == null ? [] : List<dynamic>.from(small!.map((x) => x)),
        "original":
            original == null ? [] : List<dynamic>.from(original!.map((x) => x)),
      };
}

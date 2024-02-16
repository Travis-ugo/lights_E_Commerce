import 'dart:convert';

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));

String adsToJson(Ads data) => json.encode(data.toJson());

class Ads {
  List<Ad> ads;

  Ads({
    required this.ads,
  });

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
      };
}

class Ad {
  String adsTitle;
  String adsImagePath;

  Ad({
    required this.adsTitle,
    required this.adsImagePath,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        adsTitle: json["ads_title"],
        adsImagePath: json["ads_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "ads_title": adsTitle,
        "ads_image_path": adsImagePath,
      };
}

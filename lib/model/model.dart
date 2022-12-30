import 'dart:convert';

List<PostData> postFromJson(String str) => List<PostData>.from(
      json.decode(str).map(
            (x) => PostData.fromMap(x),
          ),
    );

class PostData {
  PostData({
    this.id,
    this.link,
    this.ad_title,
    this.media,
  });

  String id;
  String link;
  String ad_title;
  String media;

  factory PostData.fromMap(Map<String, dynamic> json) => PostData(
        id: json["id"],
        link: json["link"],
        ad_title: json["ad_title"],
        media: json["media"],
      );
}

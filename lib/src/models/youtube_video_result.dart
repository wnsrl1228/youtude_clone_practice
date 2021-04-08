import 'package:flutter_youtude_clone/src/models/video.dart';

class YoutubeVideoResult {
  int totalResults;
  int resultsPerPage;
  String nextPagetoken;
  List<Video> items;

  YoutubeVideoResult(
      {this.items, this.nextPagetoken, this.resultsPerPage, this.totalResults});

  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
          totalResults: json["pageInfo"]["totalResults"],
          resultsPerPage: json["pageInfo"]["resultsPerPage"],
          nextPagetoken: json["nextPagetoken"] ?? "",
          items: List<Video>.from(//items가 리스트로 여러개라서
              json["items"].map((data) => Video.fromJson(data))));
}

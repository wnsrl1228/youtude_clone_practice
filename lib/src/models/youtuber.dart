import 'package:flutter_youtude_clone/src/models/statistics.dart';
import 'package:flutter_youtude_clone/src/models/video.dart';

class Youtuber {
  Youtuber({
    this.snippet,
    this.statistics,
  });

  Snippet snippet;
  Statistics statistics;

  factory Youtuber.fromJson(Map<String, dynamic> json) => Youtuber(
      snippet: Snippet.fromJson(json["snippet"]),
      statistics: Statistics.fromJson(json["statistics"]));
}

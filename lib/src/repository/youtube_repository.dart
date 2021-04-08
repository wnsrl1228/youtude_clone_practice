import 'package:flutter_youtude_clone/src/models/statistics.dart';
import 'package:flutter_youtude_clone/src/models/youtube_video_result.dart';
import 'package:flutter_youtude_clone/src/models/youtuber.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  //http를 감싼 상속
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult> loadVideos(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyDtghYfXT3GPrqX5RZpTe0J_5jAMP6aeIs&pageToken=$nextPageToken";
    final response = await get(url); //이 get은 GetConnect꺼
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult> search(
      String searchKeyword, String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyDtghYfXT3GPrqX5RZpTe0J_5jAMP6aeIs&pageToken=$nextPageToken&q=$searchKeyword";
    final response = await get(url); //이 get은 GetConnect꺼
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=statistics&key=AIzaSyDtghYfXT3GPrqX5RZpTe0J_5jAMP6aeIs&id=$videoId";
    final response = await get(url); //이 get은 GetConnect꺼
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyDtghYfXT3GPrqX5RZpTe0J_5jAMP6aeIs&id=$channelId";
    final response = await get(url); //이 get은 GetConnect꺼
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}

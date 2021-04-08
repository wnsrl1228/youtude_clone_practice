import 'package:flutter_youtude_clone/src/controller/video_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  YoutubePlayerController playerController;
  VideoController videoController;
  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters["videoId"]);
    playerController = YoutubePlayerController(
      initialVideoId: Get.parameters["videoId"],
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  String get title => videoController.video.snippet.title;
  String get description => videoController.video.snippet.description;
  String get videoCount => "조회수 ${videoController.statistics.value.viewCount}";
  String get likeCount => "${videoController.statistics.value.likeCount}";
  String get dislikeCount => "${videoController.statistics.value.dislikeCount}";
  String get publishedTime =>
      DateFormat("yyy-MM-dd").format(videoController.video.snippet.publishTime);
  String get youtuberThumbnailUrl => videoController.youtuberThumnailUrl;
  String get youtuberName => videoController.youtuber.value.snippet.title;
}

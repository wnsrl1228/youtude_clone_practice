import 'package:flutter_youtude_clone/src/models/statistics.dart';
import 'package:flutter_youtude_clone/src/models/video.dart';
import 'package:flutter_youtude_clone/src/models/youtuber.dart';
import 'package:flutter_youtude_clone/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  @override
  void onInit() async {
    Statistics loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);
    Youtuber loadyoutuber =
        await YoutubeRepository.to.getYoutuberInfoById(video.snippet.channelId);
    youtuber(loadyoutuber);
    // TODO: implement onInit
    super.onInit();
  }

  String get viewCountString => "조회수 ${statistics.value.viewCount ?? '-'}회";
  String get youtuberThumnailUrl {
    if (youtuber.value.snippet == null)
      return "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png";
    return youtuber.value.snippet.thumbnails.medium.url;
  }
}

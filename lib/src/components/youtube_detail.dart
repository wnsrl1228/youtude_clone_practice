import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_youtude_clone/src/controller/youtube_detail_controller.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetail extends GetView<YoutubeDetailController> {
  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            controller.title,
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text(
                controller.videoCount,
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withOpacity(0.5)),
              ),
              Text(" ㆍ "),
              Text(
                controller.publishedTime,
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withOpacity(0.5)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _descriptionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        controller.description,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _buttonOne(String iconPath, String text) {
    return Column(
      children: [
        SvgPicture.asset("assets/svg/icons/$iconPath.svg"),
        Text(text)
      ],
    );
  }

  Widget _buttonZone() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buttonOne("like", controller.likeCount),
        _buttonOne("dislike", controller.dislikeCount),
        _buttonOne("share", "공유"),
        _buttonOne("save", "저장"),
      ],
    );
  }

  Widget get line => Container(
        height: 1,
        color: Colors.black.withOpacity(0.1),
      );

  Widget _ownerZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage:
                Image.network(controller.youtuberThumbnailUrl).image,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  controller.youtuberName,
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "구독자 ${controller.videoController.youtuber.value.statistics.subscriberCount}",
                  style: TextStyle(
                      fontSize: 18, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Text(
              "구독",
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  Widget _description() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _titleZone(),
        line,
        _descriptionZone(),
        _buttonZone(),
        SizedBox(
          height: 20,
        ),
        line,
        _ownerZone(),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          YoutubePlayer(
              controller: controller.playerController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    controller.playerController.metadata.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onPressed: () {},
                ),
              ],
              onReady: () {},
              onEnded: (data) {}),
          Expanded(
            child: _description(),
          )
        ],
      ),
    );
  }
}

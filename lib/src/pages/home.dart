import 'package:flutter/material.dart';
import 'package:flutter_youtude_clone/src/app.dart';
import 'package:flutter_youtude_clone/src/components/custom_appbar.dart';
import 'package:flutter_youtude_clone/src/components/video_widget.dart';
import 'package:flutter_youtude_clone/src/controller/home_controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() => CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  title: CustomAppBar(),
                  floating: true, //앱바
                  snap: true, //앱바
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            "/detail/${controller.youtubeResult.value.items[index].id.videoId}");
                      },
                      child: VideoWidget(
                          video: controller.youtubeResult.value.items[index]),
                    );
                  },
                      childCount: controller.youtubeResult.value.items == null
                          ? 0
                          : controller.youtubeResult.value.items.length),
                )
              ],
            )));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtude_clone/src/components/youtube_detail.dart';
import 'package:flutter_youtude_clone/src/controller/youtube_detail_controller.dart';
import 'package:flutter_youtude_clone/src/controller/youtube_search_controller.dart';
import 'package:flutter_youtude_clone/src/pages/search.dart';

import 'package:get/get.dart';

import 'src/app.dart';
import 'src/binding/initbinding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Youtude clone App",
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => App()),
        GetPage(
            name: "/detail/:videoId",
            page: () => YoutubeDetail(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeDetailController>(
                () => YoutubeDetailController()))),
        GetPage(
            name: "/search",
            page: () => YoutubeSearch(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeSearchController>(
                () => YoutubeSearchController()))),
      ],
    );
  }
}

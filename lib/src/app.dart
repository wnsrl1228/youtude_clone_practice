import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_youtude_clone/src/pages/library.dart';
import 'package:flutter_youtude_clone/src/pages/subscribe.dart';
import 'package:get/get.dart';

import 'controller/app_controller.dart';
import 'pages/explore.dart';
import 'pages/home.dart';

class App extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (RouteName.values[controller.currentIndex.value]) {
          case RouteName.Home:
            return Home();
            break;
          case RouteName.Explore:
            return Explore();
            break;
          case RouteName.Suds:
            return Subscribe();
            break;
          case RouteName.Library:
            return Library();
            break;
          case RouteName.Add:
            break;
        }
        return Container();
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          onTap: controller.chagePageIndex, // 함수받는곳에 함수자체를 넣네.
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
                activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
                label: "홈"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/icons/compass_off.svg",
                  width: 22,
                ),
                activeIcon: SvgPicture.asset(
                  "assets/svg/icons/compass_on.svg",
                  width: 22,
                ),
                label: "탐색"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset(
                    "assets/svg/icons/plus.svg",
                    width: 35,
                  ),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/subs_off.svg"),
                activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg"),
                label: "구독"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/library_off.svg"),
                activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg"),
                label: "보관함"),
          ],
        ),
      ),
    );
  }
}

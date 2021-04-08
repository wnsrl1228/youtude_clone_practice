import 'package:flutter/cupertino.dart';
import 'package:flutter_youtude_clone/src/components/youtude_bottom_sheet.dart';
import 'package:get/get.dart';

enum RouteName { Home, Explore, Add, Suds, Library }

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void chagePageIndex(int index) {
    if (RouteName.values[index] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(YoutudeBottomSheet());
  }
}

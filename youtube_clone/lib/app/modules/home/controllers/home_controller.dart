import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/home/views/add_view.dart';
import 'package:youtube_clone/app/modules/home/views/home_sub_view.dart';
import 'package:youtube_clone/app/modules/home/views/library_view.dart';
import 'package:youtube_clone/app/modules/home/views/search_view.dart';
import 'package:youtube_clone/app/modules/home/views/subscribe_view.dart';

enum NavigationPages {
  HOME,
  SEARCH,
  ADD,
  SUBSCRIBE,
  LIBRARY,
}

class HomeController extends GetxController {
  final index = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void onPageChanged(int pageIndex) {
    if (NavigationPages.values[pageIndex] == NavigationPages.ADD) {
      _showBottomSheet();
    } else {
      index(pageIndex);
    }
  }

  Widget getCurrentView() {
    Widget currentPage = Container();
    switch (NavigationPages.values[index.value]) {
      case NavigationPages.HOME:
        currentPage = HomeSubView();
        break;
      case NavigationPages.SEARCH:
        currentPage = SearchView();
        break;
      case NavigationPages.ADD:
        currentPage = AddView();
        break;
      case NavigationPages.SUBSCRIBE:
        currentPage = SubscribeView();
        break;
      case NavigationPages.LIBRARY:
        currentPage = LibraryView();
        break;
    }
    return currentPage;
  }

  void _showBottomSheet() {
    Get.bottomSheet(
      AddView(),
    );
  }
}

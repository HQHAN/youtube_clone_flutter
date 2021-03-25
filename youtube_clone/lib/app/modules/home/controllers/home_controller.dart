import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/home/providers/video_provider.dart';
import 'package:youtube_clone/app/modules/home/views/add_view.dart';
import 'package:youtube_clone/app/modules/home/views/video_list_view.dart';
import 'package:youtube_clone/app/modules/home/views/library_view.dart';
import 'package:youtube_clone/app/modules/home/views/search_view.dart';
import 'package:youtube_clone/app/modules/home/views/subscribe_view.dart';

import '../video_model.dart';

enum NavigationPages {
  HOME,
  SEARCH,
  ADD,
  SUBSCRIBE,
  LIBRARY,
}

class HomeController extends GetxController {
  final index = 0.obs;
  final totalVideoCount = 0.obs;
  final videoList = [].obs;

  @override
  void onInit() {
    super.onInit();
    _videoLoad();
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
        currentPage = VideoListView();
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

  void _videoLoad() async {
    try {
      Video video = await VideoProvider.instance.getVideo();
      print(video?.items?.length);
      if (video != null && video.items != null && video.items.length > 0) {
        videoList(video.items);
      }
    } catch (e) {
      print(e);
    }
  }
}

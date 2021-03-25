import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/home/components/custom_title.dart';
import 'package:youtube_clone/app/modules/home/components/video_item.dart';
import 'package:youtube_clone/app/modules/home/controllers/home_controller.dart';

class VideoListView extends GetView {
  VideoListView({Key key}) : super(key: key);
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Container(
              child: CustomTitle(),
            ),
            floating: true,
            snap: true,
          ),
          Obx(() {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return VideoItem(items: controller.videoList[index]);
                },
                childCount: controller.videoList.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/home/components/video_item.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  _searchHistory() => ListView(
        children: List.generate(
          controller.searchHistory.length,
          (index) => ListTile(
            onTap: () =>
                controller.search(controller.searchHistory.elementAt(index)),
            leading: SvgPicture.asset(
              "assets/svg/icons/wall-clock.svg",
              width: 20,
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text("${controller.searchHistory.elementAt(index)}"),
            ),
            trailing: Icon(Icons.arrow_forward),
          ),
        ),
      );

  _searchResultList() => ListView(
        children: List.generate(
          controller.videoList.length,
          (index) => VideoItem(items: controller.videoList[index]),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/svg/icons/back.svg",
            color: Colors.black,
          ),
          onPressed: Get.back,
        ),
        title: TextField(
          onSubmitted: controller.onSaveHistory,
          controller: controller.textEditController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.withOpacity(0.3),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      body: Obx(() => controller.videoList.length > 0
          ? _searchResultList()
          : _searchHistory()),
    );
  }
}

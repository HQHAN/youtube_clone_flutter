import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_clone/app/modules/youtube_screen/controllers/youtube_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreenView extends GetView<YoutubeController> {
  Widget _titleZone() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            controller.videoController.video.snippet.title,
            style: TextStyle(fontSize: 15),
          ),
          Row(
            children: [
              Text(
                controller.videoController.viewCountString,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Text(" · "),
              Text(
                DateFormat("yyyy-MM-dd").format(
                  DateTime.parse(
                      controller.videoController.video.snippet.publishTime),
                ),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.5),
                ),
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
        controller.videoController.video.snippet.description,
        style: TextStyle(
          fontSize: 14,
        ),
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
        _buttonOne(
            "like", controller.videoController.statistics.value.likeCount),
        _buttonOne("dislike",
            controller.videoController.statistics.value.dislikeCount),
        _buttonOne("share", "공유"),
        _buttonOne("save", "저장"),
      ],
    );
  }

  Widget get line => Container(
        height: 1,
        color: Colors.black.withOpacity(0.1),
      );

  // Widget _ownerZone() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //     child: Obx(
  //       () => Row(
  //         children: [
  //           CircleAvatar(
  //             radius: 30,
  //             backgroundColor: Colors.grey.withOpacity(0.5),
  //             backgroundImage: Image.network(
  //                     "aaa.jpg")
  //                 .image,
  //           ),
  //           SizedBox(width: 15),
  //           Expanded(
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 Text(
  //                   controller.youtuber.value.snippet.title,
  //                   style: TextStyle(fontSize: 18),
  //                 ),
  //                 Text(
  //                   "구독자 ${controller.youtuber.value.statistics.subscriberCount}",
  //                   style: TextStyle(
  //                       fontSize: 14, color: Colors.black.withOpacity(0.6)),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           GestureDetector(
  //             child: Text(
  //               "구독",
  //               style: TextStyle(color: Colors.red, fontSize: 16),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _description() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _titleZone(),
          line,
          _descriptionZone(),
          _buttonZone(),
          SizedBox(height: 20),
          line,
          // _ownerZone()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          YoutubePlayer(
            controller: controller.youtubeController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  controller.youtubeController.metadata.title,
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
            onEnded: (data) {},
          ),
          Expanded(
            child: _description(),
          )
        ],
      ),
    );
  }
}

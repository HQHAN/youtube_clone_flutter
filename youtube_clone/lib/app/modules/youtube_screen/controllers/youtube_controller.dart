import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/home/controllers/video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeController extends GetxController {
  VideoController videoController;
  YoutubePlayerController youtubeController;
  @override
  void onInit() {
    videoController = Get.find<VideoController>(tag: Get.arguments['videoId']);
    youtubeController = YoutubePlayerController(
      initialVideoId: Get.arguments['videoId'],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

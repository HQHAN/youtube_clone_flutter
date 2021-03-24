import 'package:get/get.dart';

import 'package:youtube_clone/app/modules/youtube_screen/controllers/youtube_controller.dart';

class YoutubeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YoutubeController>(
      () => YoutubeController(),
    );
  }
}

import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/home/providers/video_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<VideoProvider>(
      VideoProvider(),
      permanent: true,
    );
  }
}

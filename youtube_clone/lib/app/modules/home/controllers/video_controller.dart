import 'package:get/get.dart';
import 'package:youtube_clone/app/data/respository/providers/video_provider.dart';
import 'package:youtube_clone/app/modules/home/statistics_model.dart';

import '../video_model.dart';

class VideoController extends GetxController {
  Items video;
  VideoController(this.video);
  Rx<Statistics> statistics = Statistics().obs;

  String get viewCountString => "조회수 ${statistics.value?.viewCount ?? "-"} 회";

  @override
  void onInit() {
    _loadStatistics();
    super.onInit();
  }

  _loadStatistics() async {
    try {
      Statistics stat =
          await VideoProvider.instance.getVideoStatistics(video.id.videoId);
      statistics(stat);
    } catch (e) {
      print(e);
    }
  }
}

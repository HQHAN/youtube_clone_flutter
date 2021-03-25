import 'package:get/get.dart';

import '../statistics_model.dart';
import '../video_model.dart';

class VideoProvider extends GetConnect {
  static VideoProvider get instance => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://youtube.googleapis.com';
  }

  Future<Video> getVideo() async {
    var response = await get(
        "/youtube/v3/search?part=snippet&channelId=UC0sfSZeoSUeWxys7OKkTelQ&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyBGUvL8aL_pILWkA_G1S_jWSKVE-Ol186I");
    if (response.hasError) {
      return Future.error(response.statusText);
    } else {
      print(response.body);
      return Video.fromJson(response.body);
    }
  }

  Future<Statistics> getVideoStatistics(String id) async {
    var response = await get(
        "/youtube/v3/videos?part=snippet,status,contentDetails,statistics&key=AIzaSyBGUvL8aL_pILWkA_G1S_jWSKVE-Ol186I&id=$id");
    if (response.hasError) {
      return Future.error(response.statusText);
    } else {
      print(response.body['items'][0]['statistics']);
      return Statistics.fromJson(response.body['items'][0]['statistics']);
    }
  }
  // Future<Response<Video>> postVideo(Video video) async =>
  //     await post('video', video);
  // Future<Response> deleteVideo(int id) async => await delete('video/$id');
}

import 'package:get/get.dart';

import 'package:youtube_clone/app/modules/home/bindings/home_binding.dart';
import 'package:youtube_clone/app/modules/home/views/home_view.dart';
import 'package:youtube_clone/app/modules/youtube_screen/bindings/youtube_screen_binding.dart';
import 'package:youtube_clone/app/modules/youtube_screen/views/youtube_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.YOUTUBE_SCREEN,
      page: () => YoutubeScreenView(),
      binding: YoutubeScreenBinding(),
    ),
  ];
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:youtube_clone/app/modules/home/bindings/home_binding.dart';
import 'package:youtube_clone/app/modules/home/views/home_view.dart';
import 'package:youtube_clone/app/modules/search/bindings/search_binding.dart';
import 'package:youtube_clone/app/modules/search/views/search_view.dart';
import 'package:youtube_clone/app/modules/youtube_screen/bindings/youtube_screen_binding.dart';
import 'package:youtube_clone/app/modules/youtube_screen/views/youtube_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.YOUTUBE_SCREEN,
      page: () => YoutubeScreenView(),
      binding: YoutubeScreenBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
  ];
}

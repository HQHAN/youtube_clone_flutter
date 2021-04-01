import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_clone/app/data/respository/providers/video_provider.dart';
import 'package:youtube_clone/app/modules/home/video_model.dart';

class SearchController extends GetxController {
  static const String SEARCH_HISTORY_KEY = "search_history_key";

  RxList<String> searchHistory = RxList<String>.empty(growable: true);
  RxList<Items> videoList = RxList<Items>.empty(growable: true);

  TextEditingController textEditController = TextEditingController();
  ScrollController scrollController = ScrollController();

  SharedPreferences prefs;

  String nextPageToken = "";
  String _currentKeyword = "";

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    var savedHistory = prefs.getStringList(SEARCH_HISTORY_KEY) ?? [];
    searchHistory(savedHistory);

    _eventListener();

    textEditController.addListener(() {
      print(textEditController.text);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onSaveHistory(String keyword) {
    searchHistory.addIf(!searchHistory.contains(keyword), keyword);
    prefs.setStringList(SEARCH_HISTORY_KEY, searchHistory);

    search(keyword);
  }

  void search(String keyword) {
    _currentKeyword = keyword;
    _videoLoad();
  }

  void _videoLoad() async {
    try {
      var video = await VideoProvider.instance
          .searchVideo(nextPageToken, _currentKeyword);
      print("검색결과 : ${video?.items?.length ?? 0}");
      if (video != null && video.items != null && video.items.length > 0) {
        videoList.addAll(video.items);
        nextPageToken = video.nextPageToken ?? "";
      }
    } catch (e) {
      print(e);
    }
  }

  void _eventListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.position.pixels &&
          nextPageToken != "") {
        _videoLoad();
      }
    });
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/youtube_screen/controllers/youtube_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreenView extends GetView<YoutubeController> {
  YoutubePlayerController _youtubeController = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YoutubeScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.amber,
          progressColors: ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            _youtubeController.addListener(() {});
          },
        ),
      ),
    );
  }
}

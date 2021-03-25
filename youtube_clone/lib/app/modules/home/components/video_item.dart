import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_clone/app/modules/home/controllers/video_controller.dart';
import 'package:youtube_clone/app/modules/home/video_model.dart';
import 'package:youtube_clone/app/routes/app_pages.dart';

class VideoItem extends StatefulWidget {
  final Items items;
  const VideoItem({Key key, this.items}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  VideoController _controller;
  @override
  void initState() {
    _controller =
        Get.put(VideoController(widget.items), tag: widget.items.id.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _thumbNail(),
        _videoDetail(),
      ],
    );
  }

  Widget _thumbNail() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          Paths.YOUTUBE_SCREEN + "/" + "12341515",
        );
      },
      child: Container(
        child: CachedNetworkImage(
          imageUrl: widget.items.snippet.thumbnails.high.url,
          fit: BoxFit.fitWidth,
          placeholder: (context, url) => Container(
            height: 230,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }

  Widget _videoDetail() {
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        bottom: 10.0,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(
              'https://yt3.ggpht.com/ytc/AAUvwnhaKVpUUpQ7McuhKOBUqrYcHEsBEHiF4gB3yfCt0w=s88-c-k-c0x00ffffff-no-rj',
            ).image,
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.items.snippet.title,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.topCenter,
                      icon: Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Text(
                      widget.items.snippet.channelTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    Text(' * '),
                    Obx(
                      () => Text(
                        _controller.viewCountString,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Text(' * '),
                    Expanded(
                      child: Text(
                        DateFormat("yyyy-MM-dd").format(
                          DateTime.parse(widget.items.snippet.publishTime),
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

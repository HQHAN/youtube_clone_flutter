import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/home/views/home_view.dart';

class AddView extends GetView {
  Widget _itemView(
      {String iconFileName,
      double iconWidth = 17,
      double iconHeight = 17,
      String labelText,
      Function onTapped}) {
    return InkWell(
      onTap: onTapped,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: Container(
                height: iconWidth,
                width: iconHeight,
                child: SvgPicture.asset(ASSET_FOLDER + iconFileName),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(labelText),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                child: Text('만들기'),
                padding: EdgeInsets.only(
                  left: 10.0,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Get.back(),
              ),
            ],
          ),
          _itemView(
            iconFileName: 'upload.svg',
            labelText: '동영상 업로드',
            onTapped: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          _itemView(
            iconFileName: 'broadcast.svg',
            iconHeight: 30,
            iconWidth: 30,
            labelText: '실시간 스트리밍 시작',
            onTapped: () {
              print('실시간');
            },
          ),
        ],
      ),
    );
  }
}

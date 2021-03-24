import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_clone/app/modules/home/components/custom_title.dart';

class HomeSubView extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Container(
              child: CustomTitle(),
            ),
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.all(
                    10.0,
                  ),
                  child: Container(
                    height: 150,
                    color: Colors.blueAccent.withOpacity(0.5),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeSubView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HomeSubView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

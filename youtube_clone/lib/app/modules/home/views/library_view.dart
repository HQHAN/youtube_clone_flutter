import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LibraryView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'LibraryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

const ASSET_FOLDER = 'assets/svg/icons/';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.index.value,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          onTap: controller.onPageChanged,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('${ASSET_FOLDER}home_off.svg'),
              activeIcon: SvgPicture.asset('${ASSET_FOLDER}home_on.svg'),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '${ASSET_FOLDER}compass_off.svg',
                width: 22,
              ),
              activeIcon: SvgPicture.asset(
                '${ASSET_FOLDER}compass_on.svg',
                width: 22,
              ),
              label: '탐색',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  '${ASSET_FOLDER}plus.svg',
                  width: 35,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('${ASSET_FOLDER}subs_off.svg'),
              activeIcon: SvgPicture.asset('${ASSET_FOLDER}subs_on.svg'),
              label: '구독',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('${ASSET_FOLDER}library_off.svg'),
              activeIcon: SvgPicture.asset('${ASSET_FOLDER}library_on.svg'),
              label: '보관함',
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.getCurrentView(),
      ),
    );
  }
}

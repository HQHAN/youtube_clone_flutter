import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../consts.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.index.value,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          onTap: controller.onPageChanged,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('${ICON_FOLDER}home_off.svg'),
              activeIcon: SvgPicture.asset('${ICON_FOLDER}home_on.svg'),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                '${ICON_FOLDER}compass_off.svg',
                width: 22,
              ),
              activeIcon: SvgPicture.asset(
                '${ICON_FOLDER}compass_on.svg',
                width: 22,
              ),
              label: '탐색',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  '${ICON_FOLDER}plus.svg',
                  width: 35,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('${ICON_FOLDER}subs_off.svg'),
              activeIcon: SvgPicture.asset('${ICON_FOLDER}subs_on.svg'),
              label: '구독',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('${ICON_FOLDER}library_off.svg'),
              activeIcon: SvgPicture.asset('${ICON_FOLDER}library_on.svg'),
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

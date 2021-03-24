import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../consts.dart';

class CustomTitle extends StatelessWidget {
  Widget _logo() {
    return Container(
      child: SvgPicture.asset(
        '${ICON_FOLDER}youtube.svg',
        width: 130,
      ),
    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print('bell clicked');
          },
          child: SvgPicture.asset('${ICON_FOLDER}bell.svg', width: 23),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: GestureDetector(
            onTap: () {
              print('search clicked');
            },
            child: SvgPicture.asset('${ICON_FOLDER}search.svg', width: 30),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('like clicked');
          },
          child: SvgPicture.asset('${ICON_FOLDER}like.svg', width: 23),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo(),
        _actions(),
      ],
    );
  }
}

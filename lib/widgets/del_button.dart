import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_colors.dart';
import 'button.dart';

class DelButton extends StatelessWidget {
  final void Function() onPressed;

  const DelButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      innerText: "",
      color: DarkGray,
      onPressed: () => onPressed(),
      child: SvgPicture.asset(
        'assets/icons/delete.svg',
        width: 48.w,
        height: 48.h,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';

// 모든 버튼 공통사항, 크기
class Button extends StatelessWidget {
  final String innerText;
  final Color color;
  final VoidCallback onPressed;
  final Widget? child;

  const Button({
    Key? key,
    this.child,
    required this.innerText,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: TextButton(
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.zero,
        minimumSize: Size(48.w, 72.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
      child: Center(
        child:
            child ??
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              innerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Pretendard',
                color: White,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                height: 1.25.h,
              ),
            ),
      ),
      // ),
    );
  }
}

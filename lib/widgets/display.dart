import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Display extends StatelessWidget {
  final String displayPrev;
  final String displayWork;

  const Display({
    Key? key,
    required this.displayPrev,
    required this.displayWork,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Opacity(
          opacity: 0.40,
          child: _buildText(
            displayPrev,
            fontSize: 20.sp,
            fontWeight: FontWeight.w300,
          ),
        ),

        SizedBox(
          height: 96.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            physics: BouncingScrollPhysics(),
            child: _buildText(
              displayWork,
              fontSize: 70,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText(
    String text, {
    required double fontSize,
    FontWeight fontWeight = FontWeight.w300,
  }) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontFamily: 'Pretendard',
        fontWeight: fontWeight,
        height: 1.37.h,
      ),
      child: Text(text.isEmpty ? '' : text, textAlign: TextAlign.right),
    );
  }
}

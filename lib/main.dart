import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: CalculatorDark(),
          ),
    );
  }
}

final Color DarkGray = const Color(0xFF2D2F38); // 숫자
final Color LightGray = const Color(0xFF4E4F5F); // 초기화
final Color Blue = const Color(0xFF4B5EFC); // 연산버튼
final Color White = const Color(0xFFFFFFFF); // 글자색

class CalculatorDark extends StatelessWidget {
  const CalculatorDark({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375.w,
          height: 812.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: const Color(0xFF16171C)),
          child: Stack(
            children: [
              Positioned(
                left: 20.w,
                top: 147.h,
                child: Container(
                  width: 335.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 47.h,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0.w,
                              top: -1.h,
                              child: SizedBox(
                                width: 335.w,
                                child: Opacity(
                                  opacity: 0.40,
                                  child: Text(
                                    '10÷3',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 96.h,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0.w,
                              top: 0.h,
                              child: SizedBox(
                                width: 335.w,
                                child: Text(
                                  '3.333333',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 70,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w300,
                                    height: 1.37.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Expanded(
                              child: Container(
                                height: 72.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF4E4F5F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 12.w,
                                      top: 12.h,
                                      child: SizedBox(
                                        width: 223.w,
                                        height: 48.h,
                                        child: Text(
                                          '초기화',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 32,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                            height: 1.25.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 71.75.w,
                              height: 72.h,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF4B5EFC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.r),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 12.w,
                                    top: 12.h,
                                    child: SizedBox(
                                      width: 48.w,
                                      height: 48.h,
                                      child: Text(
                                        '÷',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontFamily: 'Pretendard',
                                          fontWeight: FontWeight.w400,
                                          height: 1.25.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Button(innerText: "7", color: DarkGray),
                            Button(innerText: "8", color: DarkGray),
                            Button(innerText: "9", color: DarkGray),
                            Button(innerText: "x", color: Blue),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Button(innerText: "4", color: DarkGray),
                            Button(innerText: "5", color: DarkGray),
                            Button(innerText: "6", color: DarkGray),
                            Button(innerText: "-", color: Blue),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Button(innerText: "1", color: DarkGray),
                            Button(innerText: "2", color: DarkGray),
                            Button(innerText: "3", color: DarkGray),
                            Button(innerText: "+", color: Blue),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Button(innerText: ".", color: DarkGray),
                            Button(innerText: "0", color: DarkGray),
                            Button(innerText: "@", color: DarkGray),
                            Button(innerText: "=", color: Blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NumButton extends Button {
  const NumButton({super.key, required String innerText, required Color color})
    : super(innerText: innerText, color: color);
}

class OpButton extends Button {
  const OpButton({super.key, required String innerText, required Color color})
    : super(innerText: innerText, color: color);
}

// 모든 버튼 공통사항, 크기
// 이걸 상속받는 숫자/연산 버튼> 위치/색도 이때
class Button extends StatelessWidget {
  final String innerText;
  final Color color;
  const Button({super.key, required this.innerText, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 72.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12.w,
              top: 12.h,
              child: SizedBox(
                width: 48.w,
                height: 48.h,
                child: Text(
                  innerText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: White,
                    fontSize: 32,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.25.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

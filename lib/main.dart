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
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Pretendard',
            ),
            home: CalculatorDark(),
          ),
    );
  }
}

const Color DarkGray = const Color(0xFF2D2F38); // 숫자
const Color LightGray = const Color(0xFF4E4F5F); // 초기화
const Color Blue = const Color(0xFF4B5EFC); // 연산버튼
const Color White = const Color(0xFFFFFFFF); // 글자색

String displayText = ""; // 계산기에서 보여줄 텍스트
bool isOperatorPressed = false; // 마지막 입력이 연산자인지 여부
bool hasDecimalPoint = false; // 소수점 입력 여부 // 소수점or피연산자 눌리면 상태 변경

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
                                  displayText,
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
                              child: Button(
                                innerText: '초기화',
                                color: LightGray,
                                onPressed: () {
                                  displayText = ""; // 초기화 버튼 눌렀을 때
                                  isOperatorPressed = false;
                                  hasDecimalPoint = false;
                                },
                              ),
                            ),
                            SizedBox(
                              width: 75.w,
                              child: OpButton(innerText: "÷"),
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
                            NumButton(innerText: "7"),
                            NumButton(innerText: "8"),
                            NumButton(innerText: "9"),
                            OpButton(innerText: "x"),
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
                            NumButton(innerText: "4"),
                            NumButton(innerText: "5"),
                            NumButton(innerText: "6"),
                            OpButton(innerText: "-"),
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
                            NumButton(innerText: "1"),
                            NumButton(innerText: "2"),
                            NumButton(innerText: "3"),
                            OpButton(innerText: "+"),
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
                            NumButton(innerText: "."),
                            NumButton(innerText: "0"),
                            NumButton(innerText: "@"),
                            OpButton(innerText: "="),
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

class NumButton extends StatelessWidget {
  final String innerText;

  const NumButton({Key? key, required this.innerText}) : super(key: key);

  void onNumPressed(String text) {
    if (text == ".") {
      if (!hasDecimalPoint) { // 소수점 중복 입력 방지
        displayText += text;
        hasDecimalPoint = true;
      }
    } else if (text == "@") { // 지우기 버튼
      displayText = displayText.substring(0, displayText.length - 1)
    } else {  // 숫자 버튼
        displayText += text;
        isOperatorPressed = false;
    }
    print(displayText); // 디버깅용
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      innerText: innerText,
      color: const Color(0xFF4E4F5F), // 숫자 버튼 전용 색
      onPressed: () => onNumPressed(innerText),
    );
  }
}

// 연산자 버튼
class OpButton extends StatelessWidget {
  final String innerText;
  const OpButton({Key? key, required this.innerText}) : super(key: key);

  void onOpPressed(String text) {
    if (text == "=") {
      displayText = "결과"; 
    } else {
      if (isOperatorPressed) {   // 연산자가 이미 눌린 상태에서 또 눌렀을 때
        displayText = displayText.substring(0, displayText.length - 1) + text;
      } else {
        displayText += text;
        isOperatorPressed = true;
      }
    }
    print(displayText); // 디버깅용
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      innerText: innerText,
      color: Blue, // 연산 버튼 전용 색
      onPressed: () => onOpPressed(innerText),
    );
  }
}

// class DelButton extends Button {
//   const DelButton({super.key}) : super(innerText: "초기화", color: LightGray);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(Icon(Icons.delete, color: Colors.white, size: 32.h)),
//     );
//   }
// }

// 모든 버튼 공통사항, 크기
// 이걸 상속받는 숫자/연산 버튼> 위치/색도 이때
class Button extends StatelessWidget {
  final String innerText;
  final Color color;
  final VoidCallback onPressed;

  const Button({
    super.key,
    required this.innerText,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 72.h, // Figma에서 뽑은 높이
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),

          child: SizedBox(
            width: 48.w,
            height: 48.h,
            child: Text(
              innerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Pretendard',
                color: White,
                fontSize: 28.sp,
                fontWeight: FontWeight.w400,
                height: 1.25.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

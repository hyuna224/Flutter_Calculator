import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            home: Calculator(),
          ),
    );
  }
}

const Color DarkGray = const Color(0xFF2D2F38); // 숫자
const Color LightGray = const Color(0xFF4E4F5F); // 초기화
const Color Blue = const Color(0xFF4B5EFC); // 연산버튼
const Color White = const Color(0xFFFFFFFF); // 글자색

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Calculator> {
  String _raw = ''; // 실제 계산에 사용되는 숫자
  String _display = '0'; // 화면에 표시되는 숫자
  bool isOperatorPressed = false; // 마지막 입력이 연산자인지 여부
  bool hasDecimalPoint = false; // 소수점 입력 여부 // 소수점or피연산자 눌리면 상태 변경

  void _updateDisplay() {
    setState(() {
      _display = _raw.isEmpty ? '0' : _raw;
    });
  }

  void _onNumPressed(String input) {
    if (input == ".") {
      if (!hasDecimalPoint) {
        // 소수점 중복 입력 방지
        _raw += input;
        _updateDisplay();
        hasDecimalPoint = true;
      }
    } else {
      // 숫자 버튼
      _raw += input;
      _updateDisplay();
      isOperatorPressed = false;
    }
    print(_display); // 디버깅용
  }

  void _onOpPressed(String op) {
    if (op == '=') {
      _raw = "결과";
    } else {
      if (isOperatorPressed) {
        // 연산자가 이미 눌린 상태에서 또 눌렀을 때
        _raw = _raw.substring(0, _raw.length - 1) + op;
      } else {
        _raw += op;
        isOperatorPressed = true;
      }
    }
    _updateDisplay();
  }

  void _onBackspace() {
    if (_raw.isNotEmpty) {
      _raw = _raw.substring(0, _raw.length - 1);
      _updateDisplay();
    }
  }

  void _onClear() {
    _raw = '';
    _updateDisplay();
  }

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
                                    _display,
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
                                  _display,
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
                      RowContainer(
                        children: [
                          Expanded(
                            child: Button(
                              innerText: '초기화',
                              color: LightGray,
                              onPressed: () => _onClear(),
                            ),
                          ),
                          SizedBox(
                            width: 75.w,
                            child: OpButton(
                              innerText: "÷",
                              onPressed: _onOpPressed,
                            ),
                          ),
                        ],
                      ),
                      RowContainer(
                        children: [
                          NumButton(innerText: '7', onPressed: _onNumPressed),
                          NumButton(innerText: '8', onPressed: _onNumPressed),
                          NumButton(innerText: '9', onPressed: _onNumPressed),
                          OpButton(innerText: 'x', onPressed: _onOpPressed),
                        ],
                      ),
                      RowContainer(
                        children: [
                          NumButton(innerText: '4', onPressed: _onNumPressed),
                          NumButton(innerText: '5', onPressed: _onNumPressed),
                          NumButton(innerText: '6', onPressed: _onNumPressed),
                          OpButton(innerText: '-', onPressed: _onOpPressed),
                        ],
                      ),
                      RowContainer(
                        children: [
                          NumButton(innerText: '1', onPressed: _onNumPressed),
                          NumButton(innerText: '2', onPressed: _onNumPressed),
                          NumButton(innerText: '3', onPressed: _onNumPressed),
                          OpButton(innerText: '+', onPressed: _onOpPressed),
                        ],
                      ),
                      RowContainer(
                        children: [
                          NumButton(innerText: '.', onPressed: _onNumPressed),
                          NumButton(innerText: '0', onPressed: _onNumPressed),
                          DelButton(onPressed: _onBackspace),
                          OpButton(innerText: '=', onPressed: _onOpPressed),
                        ],
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

class RowContainer extends StatelessWidget {
  final List<Widget> children;
  const RowContainer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: children,
      ),
    );
  }
}

// 숫자 버튼
class NumButton extends StatelessWidget {
  final String innerText;
  final void Function(String) onPressed;

  const NumButton({Key? key, required this.innerText, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      innerText: innerText,
      color: const Color(0xFF4E4F5F), // 숫자 버튼 전용 색
      onPressed: () => onPressed(innerText),
    );
  }
}

// 연산자 버튼
class OpButton extends StatelessWidget {
  final String innerText;
  final void Function(String) onPressed;

  const OpButton({Key? key, required this.innerText, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      innerText: innerText,
      color: Blue, // 연산 버튼 전용 색
      onPressed: () => onPressed(innerText),
    );
  }
}

class DelButton extends StatelessWidget {
  final void Function() onPressed;

  const DelButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      child: SvgPicture.asset(
        'assets/icons/delete.svg',
        width: 48.w,
        height: 48.h,
      ),
      innerText: "",
      color: const Color(0xFF4E4F5F), // 숫자 버튼 전용 색
      onPressed: () => onPressed(),
    );
  }
}

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

          child:
              child ??
              SizedBox(
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

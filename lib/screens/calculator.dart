import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/keypad.dart';

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
                      Keypad(
                        onNumPressed: _onNumPressed,
                        onOpPressed: _onOpPressed,
                        onDelPressed: _onBackspace,
                        onClear: _onClear,
                      ),
                      /////////////////////////////////////////////////////////////////////////
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

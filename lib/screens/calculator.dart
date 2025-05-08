import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/evaluation.dart';
import '../widgets/keypad.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalState createState() => _CalState();
}

class _CalState extends State<Calculator> {
  String _raw = ''; // 실제 계산에 사용되는 숫자
  String _display = '0'; // 화면에 표시되는 숫자

  void _updateDisplay() {
    setState(() {
      _display = _raw.isEmpty ? '0' : _formatDisplay(_raw);
    });
  }

  // raw를 display에 맞게 포맷팅
  String _formatDisplay(String expression) {
    final opReg = RegExp(r'[+\-×÷]');

    if (expression.isEmpty) return '0';

    String res = "";
    // 연산자는 바로 붙이고, 숫자는 콤마를 붙인다
    while (expression.isNotEmpty) {
      final idx = expression.indexOf(opReg);

      // 연산자가 없는 경우 -> 전부 하나의 숫자
      if (idx == -1) {
        res += _formatNum(expression);
        break;
      }

      // 연산자가 처음에 있는 경우
      if (idx == 0) {
        res += expression[0];
        expression = expression.substring(1);
        continue;
      }

      // 연산자가 중간에 있는 경우 -> 연산자 앞까지 숫자
      if (idx > 0) {
        final targetNum = expression.substring(0, idx);
        res += _formatNum(targetNum); // 콤마 붙인 숫자 붙이기
        res += expression[idx]; // 연산자 붙이기
        expression = expression.substring(idx + 1);
      }
    }
    return res;
  }

  // 세자리수 콤마 처리
  String _formatNum(String num) {
    if (num.isEmpty) return '0';

    // 소수점 분리
    final parts = num.split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? '.' + parts[1] : '';

    // 정수부 뒤에서 한 글자씩 꺼내서 res에 붙이기
    var count = 0;
    String res = '';
    for (int i = intPart.length - 1; i >= 0; i--) {
      res = intPart[i] + res;
      count++;
      if (count % 3 == 0 && i != 0) {
        res = ',' + res;
      }
    }

    // 부호·소수부 재조립
    return res + decPart;
  }

  void _onNumPressed(String input) {
    final target = _getTarget();

    if (input == ".") {
      // 비어있거나 마지막이 숫자가 아닌 경우
      if (_raw.isEmpty || !_isNumLast()) {
        _raw += "0.";
        _updateDisplay();
        return;
      }

      // 마지막 요소가 소수가 아닌 경우(소수면 처리x)
      if (!_isDecimal()) {
        // 소수점 중복 입력 방지
        _raw += input;
        _updateDisplay();
      }
    } else if (input == "0") {
      if (target == "0") {
        return;
      } else {
        _raw += input;
        _updateDisplay();
        return;
      }
    } else {
      // 숫자 버튼
      // 0을 대체
      if (target == "0") {
        _raw = _raw.substring(0, _raw.length - 1) + input;
      } else {
        _raw += input;
      }
      _updateDisplay();
      return;
    }
  }

  void _onOpPressed(String op) {
    if (op == '=') {
      final result = expression_creation_and_evaluation(_raw);
      setState(() {
        // 결과를 _raw에 담거나, displayText에 포맷해서 보여주기
        _raw = result.toString();
        _updateDisplay();
      });
    } else {
      if (_isOp()) {
        // 연산자가 이미 눌린 상태에서 또 눌렀을 때
        _raw = _raw.substring(0, _raw.length - 1) + op;
      } else {
        _raw = _raw.isEmpty ? "0" + op : _raw + op;
      }
    }
    _updateDisplay();
  }

  void _onBackspace() {
    // 비어있음
    if (_raw.isEmpty) return;

    // 마지막 요소가 연산자
    if (_isOp() || _isNumLast()) {
      _raw = _raw.substring(0, _raw.length - 1);
      _updateDisplay();
      return;
    }

    // 마지막 요소가 소수점
    if (_raw[_raw.length - 2] == '0') {
      // 마지막 두 요소가 0.인 경우
      _raw = _raw.substring(0, _raw.length - 2);
    } else {
      // 마지막 두 요소가 자연수.인 경우
      _raw = _raw.substring(0, _raw.length - 1);
    }
    _updateDisplay();
  }

  void _onClear() {
    _raw = '';
    _updateDisplay();
  }

  String _getTarget() {
    final opIndex = _raw.lastIndexOf(RegExp(r'[+\-×÷]'));
    return (opIndex == -1) ? _raw : _raw.substring(opIndex + 1);
  }

  // 마지막 요소가 숫자인지 확인하는 메소드
  bool _isNumLast() {
    final numReg = RegExp(r'[0-9]');

    final length = _raw.length;
    if (length == 0) {
      return false;
    } else {
      // 마지막 요소가 숫자인지 확인
      final lastChar = _raw[length - 1];
      return numReg.hasMatch(lastChar);
    }
  }

  // 마지막 요소가 연산자인지 확인하는 메소드
  bool _isOp() {
    final opReg = RegExp(r'[+\-×÷]');

    final length = _raw.length;
    if (length == 0) {
      return false;
    } else {
      // 마지막 요소가 숫자인지 확인
      final lastChar = _raw[length - 1];
      return opReg.hasMatch(lastChar);
    }
  }

  // 마지막 요소가 소수점이 포함된 숫자인지 확인하는 메소드
  bool _isDecimal() {
    final opReg = RegExp(r'[+\-x÷]');

    // 마지막 연산자의 뒤쪽부분을 구하기
    final lastOpIdx = _raw.lastIndexOf(opReg);
    String fragment = "";

    if (lastOpIdx == -1) {
      // 연산자가 없는 경우
      fragment = _raw;
    } else if (lastOpIdx == _raw.length) {
      // 연산자가 마지막에 있는 경우
      fragment = "";
    } else {
      // 연산자 뒤에 숫자가 있는 경우
      _raw.substring(lastOpIdx + 1);
    }

    return fragment.contains('.');
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

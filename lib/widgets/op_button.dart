import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'button.dart';

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

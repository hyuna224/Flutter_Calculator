import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import 'button.dart';
import 'row_container.dart';
import 'num_button.dart';
import 'op_button.dart';
import 'del_button.dart';

class Keypad extends StatelessWidget {
  final void Function(String) onOpPressed;
  final void Function(String) onNumPressed;
  final VoidCallback onDelPressed;
  final VoidCallback onClear;

  const Keypad({
    Key? key,
    required this.onNumPressed,
    required this.onOpPressed,
    required this.onDelPressed,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        RowContainer(
          children: [
            Expanded(
              child: Button(
                innerText: '초기화',
                color: LightGray,
                onPressed: () => onClear(),
              ),
            ),
            SizedBox(
              width: 75.w,
              child: OpButton(innerText: "÷", onPressed: onOpPressed),
            ),
          ],
        ),
        RowContainer(
          children: [
            NumButton(innerText: '7', onPressed: onNumPressed),
            NumButton(innerText: '8', onPressed: onNumPressed),
            NumButton(innerText: '9', onPressed: onNumPressed),
            OpButton(innerText: 'x', onPressed: onOpPressed),
          ],
        ),
        RowContainer(
          children: [
            NumButton(innerText: '4', onPressed: onNumPressed),
            NumButton(innerText: '5', onPressed: onNumPressed),
            NumButton(innerText: '6', onPressed: onNumPressed),
            OpButton(innerText: '-', onPressed: onOpPressed),
          ],
        ),
        RowContainer(
          children: [
            NumButton(innerText: '1', onPressed: onNumPressed),
            NumButton(innerText: '2', onPressed: onNumPressed),
            NumButton(innerText: '3', onPressed: onNumPressed),
            OpButton(innerText: '+', onPressed: onOpPressed),
          ],
        ),
        RowContainer(
          children: [
            NumButton(innerText: '.', onPressed: onNumPressed),
            NumButton(innerText: '0', onPressed: onNumPressed),
            DelButton(onPressed: onDelPressed),
            OpButton(innerText: '=', onPressed: onOpPressed),
          ],
        ),
      ],
    );
  }
}

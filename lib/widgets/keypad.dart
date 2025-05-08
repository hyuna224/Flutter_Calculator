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
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
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
            Expanded(child: NumButton(innerText: '7', onPressed: onNumPressed)),
            Expanded(child: NumButton(innerText: '8', onPressed: onNumPressed)),
            Expanded(child: NumButton(innerText: '9', onPressed: onNumPressed)),
            Expanded(child: OpButton(innerText: 'x', onPressed: onOpPressed)),
          ],
        ),
        RowContainer(
          children: [
            Expanded(child: NumButton(innerText: '4', onPressed: onNumPressed)),
            Expanded(child: NumButton(innerText: '5', onPressed: onNumPressed)),
            Expanded(child: NumButton(innerText: '6', onPressed: onNumPressed)),
            Expanded(child: OpButton(innerText: '-', onPressed: onOpPressed)),
          ],
        ),
        RowContainer(
          children: [
            Expanded(child: NumButton(innerText: '1', onPressed: onNumPressed)),
            Expanded(child: NumButton(innerText: '2', onPressed: onNumPressed)),
            Expanded(child: NumButton(innerText: '3', onPressed: onNumPressed)),
            Expanded(child: OpButton(innerText: '+', onPressed: onOpPressed)),
          ],
        ),
        RowContainer(
          children: [
            Expanded(child: NumButton(innerText: '.', onPressed: onNumPressed)),
            Expanded(child: NumButton(innerText: '0', onPressed: onNumPressed)),
            Expanded(child: DelButton(onPressed: onDelPressed)),
            Expanded(child: OpButton(innerText: '=', onPressed: onOpPressed)),
          ],
        ),
      ],
    );
  }
}

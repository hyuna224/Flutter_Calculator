import 'package:flutter/material.dart';

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

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';

class MyCircleSeparator extends StatelessWidget {
  const MyCircleSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      height: 3,
      width: 3,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Myisellcolors.hvit70),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_isell_new/core/constants/sellx_colors.dart';

class MyDivador extends StatelessWidget {
  const MyDivador({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 40,
      color: Myisellcolors.hvit70,
      thickness: 0.4,
      indent: 8,
      endIndent: 8,
    );
  }
}

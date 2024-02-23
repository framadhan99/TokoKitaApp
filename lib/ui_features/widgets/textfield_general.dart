import 'package:flutter/material.dart';

import '../../config/config.dart';

class TextFieldGeneral extends StatelessWidget {
  const TextFieldGeneral({
    Key? key,
    this.controller,
    this.obscureText,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AssetColors.greenLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AssetColors.greenDark,
            ),
          )),
    );
  }
}

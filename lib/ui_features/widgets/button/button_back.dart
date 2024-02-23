import 'package:flutter/material.dart';

import '../../../config/config.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.only(right: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AssetColors.greenDark,
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}

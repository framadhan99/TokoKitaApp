import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../config/ui_helper.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.label,
    this.labelStyle,
    this.height,
    this.width,
    this.onTap,
    this.radius,
    this.color,
  });

  final String label;
  final TextStyle? labelStyle;
  final double? height;
  final double? width;
  final double? radius;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 33,
        width: width ?? screenWidth(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 30),
          color: color ?? AssetColors.greenDark,
        ),
        child: Center(
          child: Text(
            label,
            style: labelStyle ??
                AssetStyles.labelButton.copyWith(
                  height: 1,
                ),
          ),
        ),
      ),
    );
  }
}

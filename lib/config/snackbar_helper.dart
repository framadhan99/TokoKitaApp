import 'package:flutter/material.dart';
import 'package:tokokita/config/navigation_service.dart';

void showInSnackBar(String message) {
  BuildContext context = navigatorKey.currentContext!;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

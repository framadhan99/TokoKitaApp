import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class Log {
  static String appname = "Real-steel-app";
  Log([String? value]) {
    log(
      value!,
      name: appname,
    );
  }

  static success(Response response) {
    log(
      "STATUS CODE ${response.statusCode} | ${response.realUri.toString()} (data) => ${jsonEncode(response.data)}",
      name: appname,
    );
  }

  static error(DioException error) {
    log(error.toString());
    log(
      "STATUS CODE ${error.response?.statusCode} | ${error.response?.realUri.toString()} (error) => ${error.response?.data}",
      name: appname,
    );
  }
}

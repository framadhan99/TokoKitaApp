import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tokokita/app/models/user.dart';
import 'package:tokokita/app/models/user_storage.dart';
import 'package:tokokita/config/log_helper.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/helpers/user_info.dart';

class AuthRepository {
  final Dio _dio = Dio();
  final token = storage.user?.token;
  Future<Data?> LoginRepository(Map<String, dynamic> request) async {
    try {
      final Options options = Options(headers: {
        "Accept": "application/json",
      });

      var res = await _dio.post(ApiUrl.login, options: options, data: request);
      if (res.statusCode == 200) {
        Log.success(res);
        UserInfo().setToken(res.data['data']['token']);
        final data = res.data;
        return User.fromMap(data).data;
      }
    } on DioException catch (e) {
      Log.error(e);
    }
    return null;
  }

  Future<Data?> registrasiRepository(Map<String, dynamic> request) async {
    try {
      final Options options = Options(headers: {
        "Accept": "application/json",
      });

      var res =
          await _dio.post(ApiUrl.registrasi, options: options, data: request);
      if (res.statusCode == 201) {
        Log.success(res);
        final data = res.data;
        return User.fromMap(data).data;
      }
    } on DioException catch (e) {
      Log.error(e);
    }
    return null;
  }

  Future<Data?> logoutRepository() async {
    try {
      final Options options = Options(headers: {
        "Accept": "application/json",
        "Authorization": token,
      });

      var res = await _dio.post(ApiUrl.logout, options: options);
      if (res.statusCode == 200) {
        Log.success(res);
        final data = res.data;
        return User.fromMap(data).data;
      }
    } on DioException catch (e) {
      Log.error(e);
    }
    return null;
  }
}

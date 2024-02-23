import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokokita/app/models/user_storage.dart';
import 'package:tokokita/app/repositories/auth_repository.dart';

class UserInfo {
  // static Future<SharedPreferences> instance = SharedPreferences.getInstance();
  // static Future getSession() async {
  //   var pref = await instance;
  //   var data = pref.getString("user");
  //   if (data != null) {
  //     var user = jsonDecode(data);
  //     var res = await AuthRepository().LoginRepository(user['id']);
  //     if (res != null) {
  //       storage.user = res;
  //     }
  //   }
  // }

  // static Future addSession() async {
  //   var pref = await instance;
  //   var user = storage.user?.toJson();
  //   pref.setString("user", jsonEncode(user));
  // }

  // static void clearToken() async {
  //   var pref = await instance;
  //   pref.clear();
  //   storage.user = null;
  // }

  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("token", value);
  }

  // untuk menampilkan atau untuk mendapatkan token dari shared_preferences
  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }
}

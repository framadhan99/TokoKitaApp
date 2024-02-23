import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tokokita/app/models/user_storage.dart';
import 'package:tokokita/app/repositories/auth_repository.dart';
import 'package:tokokita/config/config.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/ui_features/pages/home/home_page.dart';
import 'package:tokokita/ui_features/pages/login_page.dart';

import '../../config/snackbar_helper.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      _isLoading = val;
      notifyListeners();
    });
  }

  Future<void> loginProvider(String email, String password) async {
    isLoading = true;
    try {
      await AuthRepository().LoginRepository({
        "email": email,
        "password": password,
      }).then((value) => nextScreen(HomePage()));
    } catch (e) {
      isLoading = false;
      throw Exception(e);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> registrasiProvider(
      String name, String email, String password) async {
    isLoading = true;
    try {
      var res = await AuthRepository().registrasiRepository({
        "name": name,
        "email": email,
        "password": password,
      });
      isLoading = false;
      if (res != null) {
        showInSnackBar("Success create Accout");
        nextScreen(LoginPage());
      }
    } catch (e) {
      isLoading = false;
      throw Exception(e);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await AuthRepository().logoutRepository().then((value) => nextScreen(
          LoginPage(),
        ));
  }
}

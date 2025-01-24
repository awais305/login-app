import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/repo/user_repo.dart';

class UserProvider extends ChangeNotifier {
  final _repo = UserRepo();

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get loginError => _loginError;
  String? get loginSuccess => _loginSuccess;

  bool _isLoading = false;
  UserModel? _user;

  String? _loginError;
  String? _loginSuccess;

  Future login({required String email, required String password}) async {
    _resetValues();
    _isLoading = true;
    notifyListeners();

    var result = await _repo.login(email, password);

    if (result?.status == 'success') {
      _user = result;
      _loginSuccess = result?.message;
      log(_loginSuccess!);
      _isLoading = false;
      notifyListeners();
    } else {
      _loginError = result?.message;
      log(_loginError!);
      _isLoading = false;
      notifyListeners();
    }
  }

  void _resetValues() {
    _loginError = null;
    _loginSuccess = null;
    _user = null;
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/models/user_model.dart';

class UserRepo {
  var headers = <String, String>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future<UserModel?> login(String email, String password) async {
    // Validating user from static credentials
    await Future.delayed(Duration(seconds: 1));
    if (email != 'user@speedforce.com' || password != 'password') {
      return UserModel(status: 'failed', message: 'Invalid email or password!');
    }

    final response = await http.get(
      Uri.parse('https://my-json-server.typicode.com/hameezk/HiringTask/login'),
      headers: headers,
    );

    var decodedJson = jsonDecode(response.body);

    if (decodedJson['status'] == 'success') {
      final UserModel user = UserModel.fromJson(decodedJson);
      debugPrint('=================== ${user.data?.toJson()}');
      return user;
    } else {
      return UserModel(status: 'failed', message: 'Something went wrong!');
    }
  }
}

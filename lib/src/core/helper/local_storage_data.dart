import 'dart:convert';

import 'package:dev_guide/src/core/constants.dart';
import 'package:dev_guide/src/domain/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  static LocalStorageData instance = Get.find();

  // Save User Data

  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      // ignore: unnecessary_null_comparison
      if (userModel == null) {
        return null;
      } else {
        return userModel;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        Constants.CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(Constants.CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

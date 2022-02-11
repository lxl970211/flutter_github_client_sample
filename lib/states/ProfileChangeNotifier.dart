

import 'package:flutter/material.dart';
import 'package:test_stu/common/Global.dart';
import 'package:test_stu/models/index.dart';

class ProfileChangeNotifier extends ChangeNotifier{

  Profile get profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }



}
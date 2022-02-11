import 'package:flutter/material.dart';
import 'package:test_stu/common/Global.dart';
import 'package:test_stu/widgets/my_app.dart';

void main() {
  Global.init().then((value) => runApp(MyApp()));
}





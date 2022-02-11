import 'package:flutter/material.dart';
import 'package:test_stu/common/Global.dart';
import 'package:test_stu/states/ProfileChangeNotifier.dart';

class ThemeModel extends ProfileChangeNotifier{

  MaterialColor get theme => Global.themes
      .firstWhere((element) => element.value == profile.theme, orElse: ()=> Colors.blue);

  set theme(ColorSwatch color){
    if(color != theme){
      profile.theme = color[500]!.value;
      notifyListeners();
    }
  }


}
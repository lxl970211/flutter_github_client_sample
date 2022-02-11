import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_stu/models/index.dart';

import 'CacheObject.dart';
import 'Git.dart';

/**
 * 主题色
 */
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red
];

class Global {
  static late SharedPreferences _prefs;

  static Profile profile = Profile();

  //网络缓存对象
  static NetCache netCache = NetCache();

  static List<MaterialColor> get themes => _themes;

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //sp初始化
    _prefs = await SharedPreferences.getInstance();
    //获取到保存的配置
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    } else {
      //设置配置的主题，默认蓝色
      profile = Profile()..theme = 0;
    }
    // Git.init();

    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true //开启缓存
      ..maxAge = 3600 //缓存时间
      ..maxCount = 100; //缓存数量
  }

  //持久化保存配置信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}

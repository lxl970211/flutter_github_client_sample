import 'package:json_annotation/json_annotation.dart';
import "user.dart";
import "cacheConfig.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  Profile();

  User? user; //Github账号信息，结构见"user.json"
  String? token;// 登录用户的token(oauth)或密码
  late num theme;//主题索引
  CacheConfig? cache;// 缓存策略信息，结构见"cacheConfig.json"
  String? lastLogin;//最近一次的注销登录的用户名
  String? locale;// APP语言信息
  
  factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'cacheConfig.g.dart';

@JsonSerializable()
class CacheConfig {
  CacheConfig();

  late bool enable;// 是否启用缓存
  late num maxAge;// 缓存的最长时间，单位（秒）
  late num maxCount;// 最大缓存数


  factory CacheConfig.fromJson(Map<String,dynamic> json) => _$CacheConfigFromJson(json);
  Map<String, dynamic> toJson() => _$CacheConfigToJson(this);
}

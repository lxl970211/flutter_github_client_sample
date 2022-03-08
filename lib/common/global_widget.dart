import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget gmAvatar(String url,
    {double width = 30,
    double? height,
    BoxFit? fit,
    BorderRadius? borderRadius}) {
  var placeholder = Image.asset(
    'images/ic_launcher.png',
    width: width,
    height: height,
  );

  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(imageUrl: url,
        fit: fit,
        placeholder: (context, url) => placeholder,
        errorWidget: (context, url, error) => placeholder,
        width: width, height: height),
  );
}

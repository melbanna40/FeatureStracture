import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageUtils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  static String getSVGPath(String name, {String format = 'svg'}) {
    return 'assets/svg/$name.$format';
  }

  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg = "assets/images/icon"}) {
    if (imageUrl.isEmpty) {
      return AssetImage(getImagePath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageUtils {
  static String getImagePath(String name,
      {String folderName = 'icons', String format = 'png'}) {
    return 'assets/$folderName/$name.$format';
  }

  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg = "assets/images/icon"}) {
    if (imageUrl.isEmpty) {
      return AssetImage(getImagePath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }
}

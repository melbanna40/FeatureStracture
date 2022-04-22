import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'image_utils.dart';

class ImageLoader {
  static CachedNetworkImage loadDefault(String url,
      {BoxFit fit = BoxFit.scaleDown,
        double height = double.infinity,
        double width = double.infinity,
        Icon? iconPlaceholder}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) =>
      iconPlaceholder ??
          Image.asset(
            ImageUtils.getImagePath("ic_kafey_logo"),
          ),
      errorWidget: (context, url, error) =>
      iconPlaceholder ??
          Image.asset(
            ImageUtils.getImagePath("ic_kafey_logo"),
          ),
    );
  }

  static CachedNetworkImage loadDefaultWithPlaceHolder(String? url, {
    BoxFit fit = BoxFit.scaleDown,
    double height = double.infinity,
    double width = double.infinity,
  }) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      height: height,
      width: width,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(
              child: CircularProgressIndicator(
                  value: downloadProgress.progress)),
      errorWidget: (context, url, error) =>
          Image(image: AssetImage(ImageUtils.getImagePath('ic_kafey_logo'))),
      // Image.asset(ImageUtils.getImagePath('img-placeholder')),
    );
  }

  static CachedNetworkImage loadNoPlaceHolder(String url,
      {BoxFit fit = BoxFit.fill,
        double height = double.infinity,
        double width = double.infinity}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
    );
  }

  static CachedNetworkImage loadDefaultA(String url,
      {BoxFit fit = BoxFit.scaleDown,
        double height = double.infinity,
        double width = double.infinity,
        Icon? iconPlaceholder}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) =>
      iconPlaceholder ??
          Image.asset(
            ImageUtils.getImagePath("ic_kafey_logo"),
          ),
      errorWidget: (context, url, error) =>
      iconPlaceholder ??
          Image.asset(
            ImageUtils.getImagePath("ic_kafey_logo"),
          ),
    );
  }
}

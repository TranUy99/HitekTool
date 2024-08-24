import 'package:tool/common/config/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';

class OctoBlurUtils {
  static OctoPlaceholderBuilder placeHolder(String? hash, {BoxFit? fit}) {
    return (context) => SizedBox.expand(
          child: hash == null
              ? Image.asset(ImagePaths.logo)
              : Image(
                  image: BlurHashImage(hash),
                  fit: fit ?? BoxFit.cover,
                ),
        );
  }

  static OctoErrorBuilder error(
    String? hash, {
    BoxFit? fit,
  }) {
    return OctoError.placeholderWithErrorIcon(
      placeHolder(hash, fit: fit),
      iconSize: 0,
    );
  }
}

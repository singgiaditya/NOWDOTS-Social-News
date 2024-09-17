import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/core/constant/images.dart';
import 'package:shimmer/shimmer.dart';

class AvatarCacheImage extends StatelessWidget {
  const AvatarCacheImage({
    super.key,
    required this.image,
    this.radius,
  });

  final String? image;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(anonymousAvatar),
      );
    }
    return CachedNetworkImage(
      imageUrl: image!,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
        radius: radius,
      ),
      placeholder: (context, url) => Shimmer(
          gradient: shimmerGradient,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: boxColor,
          )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

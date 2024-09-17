import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:shimmer/shimmer.dart';

class ImageHero extends StatelessWidget {
  const ImageHero(
      {super.key,
      required this.data,
      required this.index,
      required this.width,
      required this.type,
      required this.height});

  final Feed data;
  final int index;
  final double? width;
  final double? height;
  final int type;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(12);
    switch (type) {
      case 1:
        borderRadius = BorderRadius.circular(12);
        break;
      case 2:
        borderRadius = const BorderRadius.only(
            topLeft: Radius.circular(12), bottomLeft: Radius.circular(12));
      case 3:
        borderRadius = const BorderRadius.only(
            topRight: Radius.circular(12), bottomRight: Radius.circular(12));
        break;
      case 4:
        borderRadius = const BorderRadius.only(topRight: Radius.circular(12));
        break;
      case 5:
        borderRadius =
            const BorderRadius.only(bottomRight: Radius.circular(12));
        break;
      case 6:
        borderRadius = const BorderRadius.only(topLeft: Radius.circular(12));
        break;
      case 7:
        borderRadius = const BorderRadius.only(bottomLeft: Radius.circular(12));
        break;
      default:
        break;
    }

    return GestureDetector(
      onTap: () {
        context.pushNamed("image",
            extra: data, pathParameters: {"index": index.toString()});
      },
      child: Hero(
        tag: data.photos![index],
        child: CachedNetworkImage(
          imageUrl: baseUrl + data.photos![index]['file_path'],
          imageBuilder: (context, imageProvider) {
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder: (context, url) => Shimmer(
            gradient: shimmerGradient,
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: boxColor),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/data/models/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/row_button_container.dart';

class FullscreenImage extends StatelessWidget {
  const FullscreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    final Feed data = GoRouterState.of(context).extra! as Feed;
    final int index =
        int.parse(GoRouterState.of(context).pathParameters["index"]!);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(children: [
          Hero(
            tag: data.image![index],
            child: CachedNetworkImage(
              imageUrl: data.image![index],
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 21),
              color: Colors.black54,
              child: Column(
                children: [
                  RowButtonContainer(
                      color: Colors.white,
                      backgroundColor: Colors.transparent,
                      likeCount: data.likeCount!,
                      commentCount: data.commentCount!,
                      forwardCount: data.forwardCount!,
                      upVoteCount: data.upVoteCount ?? "0"),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      style: regularSegoeUITextStyle.copyWith(
                          fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(80)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(80)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(80)),
                          hintText: "Post your reply",
                          hintStyle: regularSegoeUITextStyle.copyWith(
                              fontSize: 14, color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

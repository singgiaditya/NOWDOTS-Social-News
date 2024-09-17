import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/utils/reaction_utils.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/vote/vote_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/row_button_container.dart';

class FullscreenImage extends StatefulWidget {
  const FullscreenImage({super.key});

  @override
  State<FullscreenImage> createState() => _FullscreenImageState();
}

class _FullscreenImageState extends State<FullscreenImage> {
  @override
  Widget build(BuildContext context) {
    final Feed data = GoRouterState.of(context).extra! as Feed;
    final int index =
        int.parse(GoRouterState.of(context).pathParameters["index"]!);
    final CarouselController controller =
        CarouselController(initialItem: index);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(children: [
          CarouselView(
            backgroundColor: Colors.black,
            itemSnapping: true,
            padding: EdgeInsets.all(0),
            itemExtent: MediaQuery.of(context).size.width,
            shape: Border.all(),
            controller: controller,
            children: List<Widget>.generate(data.photosCount!, (int index) {
              return Hero(
                tag: baseUrl + data.photos![index]["file_path"],
                child: CachedNetworkImage(
                  imageUrl: baseUrl + data.photos![index]["file_path"],
                  placeholder: (context, url) => const Center(
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
              );
            }),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Colors.black54, shape: BoxShape.circle),
                      child: const Icon(
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
              padding: const EdgeInsets.symmetric(horizontal: 21),
              color: Colors.black54,
              child: Column(
                children: [
                  BlocConsumer<VoteBloc, VoteState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () => setState(() {}),
                      );
                    },
                    builder: (context, state) {
                      return RowButtonContainer(
                        color: Colors.white,
                        backgroundColor: Colors.transparent,
                        data: data,
                        reactionType: getReactionTypeFromListData(
                            data.likes, data.dislikes),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                    child: TextField(
                      style: regularSegoeUITextStyle.copyWith(
                          fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(80)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(80)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(80)),
                          hintText: "Post your reply",
                          hintStyle: regularSegoeUITextStyle.copyWith(
                              fontSize: 14, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
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

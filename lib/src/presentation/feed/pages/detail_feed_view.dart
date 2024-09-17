import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/comment_card.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/detail_feed_card.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/hashtag_text.dart';

class DetailFeedView extends StatelessWidget {
  const DetailFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    final Feed data = GoRouterState.of(context).extra! as Feed;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Post"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              iconSize: 30,
            )
          ],
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  DetailFeedCard(data: data),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 21),
                    child: ListView.separated(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 21,
                      ),
                      itemBuilder: (context, index) =>
                          CommentCardExpandedWidget(),
                    ),
                  )
                ],
              ),
            ),
            const ReplyTextField()
          ],
        ),
      ),
    );
  }
}

class ReplyTextField extends StatefulWidget {
  const ReplyTextField({
    super.key,
  });

  @override
  State<ReplyTextField> createState() => _ReplyTextFieldState();
}

class _ReplyTextFieldState extends State<ReplyTextField> {
  final TextEditingController replyController = TextEditingController();
  // final FocusNode focusNode = FocusNode();
  bool isEmpty = false;
  bool isFocused = false;

  void checkEmpty() {
    isEmpty = replyController.text.isEmpty;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: boxColor, width: 1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: isFocused,
              child: HashtagText(
                  text: "Replying to @johndoee",
                  regularTextStyle: regularSegoeUITextStyle.copyWith(
                      fontSize: 14, color: primaryColor),
                  decoratedTextStyle: regularSegoeUITextStyle.copyWith(
                      fontSize: 14, color: buttonColor)),
            ),
            Visibility(
              visible: isFocused,
              child: const SizedBox(
                height: 14,
              ),
            ),
            Focus(
              onFocusChange: (value) {
                isFocused = value;
                setState(() {});
              },
              child: SizedBox(
                height: 35,
                child: TextField(
                  controller: replyController,
                  onChanged: (value) => checkEmpty(),
                  keyboardType: TextInputType.text,
                  style: regularSegoeUITextStyle.copyWith(
                      fontSize: 14, color: primaryColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: boxColor,
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
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
                          fontSize: 14, color: thirdColor)),
                ),
              ),
            ),
            Visibility(
              visible: isFocused,
              child: const SizedBox(
                height: 14,
              ),
            ),
            Visibility(
              visible: isFocused,
              child: Row(
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.image_outlined)),
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.gif_box_outlined)),
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.poll_outlined)),
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.emoji_emotions_outlined)),
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.calendar_month_outlined)),
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.location_on_outlined))
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    height: 35,
                    width: 85,
                    child: ElevatedButton(
                        onPressed: isEmpty ? null : () {},
                        child: Text(
                          "Reply",
                          style: subtitleProximaNovaTextStyle.copyWith(
                              fontSize: 14, color: Colors.white),
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

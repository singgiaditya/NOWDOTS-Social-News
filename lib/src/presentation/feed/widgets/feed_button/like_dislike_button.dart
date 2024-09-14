import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/enums/reaction_enums.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/reaction/reaction_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/reaction_button.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/reaction_show_menu.dart';

class LikeDislikeButton extends StatefulWidget {
  final Feed? data;
  final Color color;
  final Color backgroundColor;
  final ReactionType reactionType;
  const LikeDislikeButton(
      {super.key,
      required this.data,
      required this.color,
      required this.backgroundColor,
      required this.reactionType});

  @override
  _LikeDislikeButtonState createState() => _LikeDislikeButtonState();
}

class _LikeDislikeButtonState extends State<LikeDislikeButton> {
  late ReactionType reaction;
  late int likesCount;
  @override
  void initState() {
    super.initState();
    reaction = widget.reactionType;
    likesCount = widget.data!.likesCount ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory),
          child: GestureDetector(
            onTap: () {
              if (reaction != ReactionType.NONE &&
                  reaction != ReactionType.BAD) {
                context.read<ReactionBloc>().add(
                    ReactionEvent.unReaction(reaction, "${widget.data!.id}"));
                setState(() {
                  reaction = ReactionType.NONE;
                  likesCount--;
                });
              } else {
                context.read<ReactionBloc>().add(ReactionEvent.reaction(
                    ReactionType.GOOD, "${widget.data!.id}"));
                setState(() {
                  reaction = ReactionType.GOOD;
                  likesCount++;
                });
              }
            },
            onLongPressStart: (details) async {
              final offset = details.globalPosition;
              final result = await reactionShowMenu(context, offset);
              if (result != null && result != reaction) {
                BlocProvider.of<ReactionBloc>(context)
                    .add(ReactionEvent.reaction(result, "${widget.data!.id}"));
                if (reaction == ReactionType.NONE) {
                  likesCount++;
                }
                reaction = result;
                setState(() {});
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: const BorderRadiusDirectional.horizontal(
                      start: Radius.circular(80))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  reactionButton(widget.color, reaction),
                  Text(
                    "${likesCount}",
                    style: regularProximaNovaTextStyle.copyWith(
                        fontSize: 16, color: widget.color),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 1.5,
        ),
        GestureDetector(
          onTap: () {
            if (reaction == ReactionType.BAD) {
              context.read<ReactionBloc>().add(ReactionEvent.unReaction(
                  ReactionType.BAD, "${widget.data!.id}"));
              reaction = ReactionType.NONE;
            } else {
              context.read<ReactionBloc>().add(ReactionEvent.reaction(
                  ReactionType.BAD, "${widget.data!.id}"));
              if (reaction != ReactionType.NONE &&
                  reaction != ReactionType.BAD) {
                likesCount--;
              }
              reaction = ReactionType.BAD;
            }
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: const BorderRadiusDirectional.horizontal(
                    end: Radius.circular(80))),
            child: reaction == ReactionType.BAD
                ? SvgPicture.asset(
                    thumbDownFilled,
                  )
                : SvgPicture.asset(
                    thumbDownOutline,
                    color: widget.color,
                  ),
          ),
        )
      ],
    );
  }
}

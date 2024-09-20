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
  const LikeDislikeButton(
      {super.key,
      required this.data,
      required this.color,
      required this.backgroundColor});

  @override
  _LikeDislikeButtonState createState() => _LikeDislikeButtonState();
}

class _LikeDislikeButtonState extends State<LikeDislikeButton> {
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
              if (widget.data!.reactionType != ReactionType.NONE &&
                  widget.data!.reactionType != ReactionType.BAD) {
                context.read<ReactionBloc>().add(ReactionEvent.unReaction(
                    widget.data!.reactionType!, "${widget.data!.id}"));
                widget.data!.reactionType = ReactionType.NONE;
                widget.data!.likesCount = widget.data!.likesCount! - 1;
              } else {
                context.read<ReactionBloc>().add(ReactionEvent.reaction(
                    ReactionType.GOOD, "${widget.data!.id}"));
                widget.data!.reactionType = ReactionType.GOOD;
                widget.data!.likesCount = widget.data!.likesCount! + 1;
              }
            },
            onLongPressStart: (details) async {
              final offset = details.globalPosition;
              final result = await reactionShowMenu(context, offset);
              if (result != null && result != widget.data!.reactionType) {
                BlocProvider.of<ReactionBloc>(context)
                    .add(ReactionEvent.reaction(result, "${widget.data!.id}"));
                if (widget.data!.reactionType == ReactionType.NONE ||
                    widget.data!.reactionType == ReactionType.BAD) {
                  widget.data!.likesCount = widget.data!.likesCount! + 1;
                }
                widget.data!.reactionType = result;
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
                  reactionButton(widget.color,
                      widget.data!.reactionType ?? ReactionType.NONE),
                  Text(
                    "${widget.data!.likesCount}",
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
            if (widget.data!.reactionType == ReactionType.BAD) {
              context.read<ReactionBloc>().add(ReactionEvent.unReaction(
                  ReactionType.BAD, "${widget.data!.id}"));
              widget.data!.reactionType = ReactionType.NONE;
            } else {
              context.read<ReactionBloc>().add(ReactionEvent.reaction(
                  ReactionType.BAD, "${widget.data!.id}"));
              if (widget.data!.reactionType != ReactionType.NONE &&
                  widget.data!.reactionType != ReactionType.BAD) {
                widget.data!.likesCount = widget.data!.likesCount! - 1;
              }
              widget.data!.reactionType = ReactionType.BAD;
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: const BorderRadiusDirectional.horizontal(
                    end: Radius.circular(80))),
            child: widget.data!.reactionType == ReactionType.BAD
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

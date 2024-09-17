import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/icons.dart';
import 'package:nowdots_social_news/src/core/enums/vote_enums.dart';
import 'package:nowdots_social_news/src/data/models/feed/feeds_response_model.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/vote/vote_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Container upvoteDownvoteButton(
    String upVoteCount, Color color, Color backgroundColor, VoteType voteType) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
        color: backgroundColor, borderRadius: BorderRadius.circular(80)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        voteType == VoteType.UP
            ? SvgPicture.asset(
                upVoteFilled,
              )
            : SvgPicture.asset(
                upVoteOutline,
                color: color,
              ),
        const SizedBox(
          width: 4,
        ),
        Text(
          upVoteCount,
          style:
              regularProximaNovaTextStyle.copyWith(fontSize: 16, color: color),
        ),
        const SizedBox(
          width: 4,
        ),
        voteType == VoteType.DOWN
            ? SvgPicture.asset(
                downVoteFilled,
              )
            : SvgPicture.asset(
                downVoteOutline,
                color: color,
              ),
      ],
    ),
  );
}

class UpvoteDownvoteWidget extends StatefulWidget {
  final Feed? data;
  final Color color;
  final Color backgroundColor;
  UpvoteDownvoteWidget({
    super.key,
    required this.data,
    required this.color,
    required this.backgroundColor,
  });

  @override
  _UpvoteDownvoteWidgetState createState() => _UpvoteDownvoteWidgetState();
}

class _UpvoteDownvoteWidgetState extends State<UpvoteDownvoteWidget> {
  // late VoteType voteType;
  // late int upVoteCount;

  // @override
  // void initState() {
  //   super.initState();
  //   voteType = widget.voteType;
  //   upVoteCount = widget.data!.upVoteCount ?? 0;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(80)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.data!.voteType == VoteType.UP
              ? GestureDetector(
                  onTap: () {
                    context.read<VoteBloc>().add(
                        VoteEvent.unVote(VoteType.UP, "${widget.data?.id}"));
                    widget.data!.upVoteCount = widget.data!.upVoteCount! - 1;
                    widget.data!.voteType = VoteType.NONE;
                  },
                  child: SvgPicture.asset(
                    upVoteFilled,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    context
                        .read<VoteBloc>()
                        .add(VoteEvent.vote(VoteType.UP, "${widget.data?.id}"));
                    widget.data!.upVoteCount = widget.data!.upVoteCount! + 1;
                    widget.data!.voteType = VoteType.UP;
                  },
                  child: SvgPicture.asset(
                    upVoteOutline,
                    color: widget.color,
                  ),
                ),
          const SizedBox(
            width: 4,
          ),
          Text(
            "${widget.data!.upVoteCount ?? 0}",
            style: regularProximaNovaTextStyle.copyWith(
                fontSize: 16, color: widget.color),
          ),
          const SizedBox(
            width: 4,
          ),
          widget.data!.voteType == VoteType.DOWN
              ? GestureDetector(
                  onTap: () {
                    context.read<VoteBloc>().add(
                        VoteEvent.unVote(VoteType.DOWN, "${widget.data?.id}"));
                    widget.data!.voteType = VoteType.NONE;
                  },
                  child: SvgPicture.asset(
                    downVoteFilled,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    context.read<VoteBloc>().add(
                        VoteEvent.vote(VoteType.DOWN, "${widget.data?.id}"));
                    if (widget.data!.voteType == VoteType.UP) {
                      widget.data!.upVoteCount = widget.data!.upVoteCount! - 1;
                    }
                    widget.data!.voteType = VoteType.DOWN;
                  },
                  child: SvgPicture.asset(
                    downVoteOutline,
                    color: widget.color,
                  ),
                ),
        ],
      ),
    );
  }
}

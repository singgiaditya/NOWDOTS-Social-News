import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/logos.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_news/get_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_news/get_feeds_state.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_card.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            nowdotsLogo,
            scale: 2,
          ),
          title: Text("Feeds"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 30,
            )
          ],
          bottom: TabBar(tabs: [
            Tab(
              text: "For You",
            ),
            Tab(
              text: "Following",
            )
          ]),
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [_buildBody(), _buildBody()]),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          CreatePostCard(),
          Divider(
            color: boxColor,
          ),
          BlocBuilder<GetFeedsBloc, GetFeedsState>(
            builder: (context, state) {
              if (state is GetFeedsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetFeedsError) {
                return Center(
                  child: Text("${state.error}"),
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: boxColor,
                ),
                itemCount: state.feeds!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return FeedCard(
                    data: state.feeds![index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CreatePostCard extends StatelessWidget {
  const CreatePostCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 21, horizontal: 21),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/200/300"),
            radius: 25,
          ),
          SizedBox(
            width: 9,
          ),
          Text(
            "Create Post",
            style: regularSegoeUITextStyle.copyWith(
                fontSize: 15, color: thirdColor),
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.image_outlined))
        ],
      ),
    );
  }
}

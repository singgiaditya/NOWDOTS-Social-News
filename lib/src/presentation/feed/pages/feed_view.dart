import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/bloc/get_user/get_user_bloc.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/logos.dart';
import 'package:nowdots_social_news/src/core/enums/feed_type_enums.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_followiing_feeds/get_all_following_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/reaction/reaction_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/vote/vote_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/more_menu_feed.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/share_menu_feed.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_card.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/loading_feed_card.dart';
import 'package:shimmer/shimmer.dart';

class FeedView extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentKey;
  const FeedView({super.key, required this.parentKey});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  String getLogo(FeedType type) {
    switch (type) {
      case FeedType.NOWDOTS:
        return nowdotsLogo;
      case FeedType.NOWHER:
        return nowherLogo;
      case FeedType.NOWFOODIE:
        return nowfoodieLogo;
      case FeedType.NOWPLAY:
        return nowplayLogo;
      case FeedType.NOWSPORT:
        return nowsportsLogo;
      case FeedType.NOWHYPE:
        return nowhypeLogo;
      default:
        return nowdotsLogo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, FeedType>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            body: NestedScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      snap: true,
                      leading: GestureDetector(
                        onTap: () {
                          widget.parentKey.currentState!.openDrawer();
                        },
                        child: Image.asset(
                          getLogo(state),
                          scale: 2,
                        ),
                      ),
                      title: const Text("Feeds"),
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          iconSize: 30,
                        )
                      ],
                      floating: true,
                    ),
                    PinnedHeaderSliver(
                      child: Container(
                        color: Colors.white,
                        child: SafeArea(
                          child: TabBar(
                              labelStyle:
                                  titleSegoeUITextStyle.copyWith(fontSize: 14),
                              labelColor: primaryColor,
                              unselectedLabelColor: thirdColor,
                              dividerColor: boxColor,
                              indicatorColor: primaryColor,
                              tabs: [
                                Tab(
                                  text: "For You",
                                ),
                                Tab(
                                  text: "Following",
                                )
                              ]),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(children: [
                  MultiBlocListener(
                    listeners: [
                      BlocListener<VoteBloc, VoteState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {
                              setState(() {});
                            },
                          );
                        },
                      ),
                      BlocListener<ReactionBloc, ReactionState>(
                        listener: (context, state) {
                          state.maybeWhen(orElse: () {
                            setState(() {});
                          });
                        },
                      ),
                    ],
                    child: _buildBody(state, false),
                  ),
                  MultiBlocListener(
                    listeners: [
                      BlocListener<VoteBloc, VoteState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {
                              setState(() {});
                            },
                          );
                        },
                      ),
                      BlocListener<ReactionBloc, ReactionState>(
                        listener: (context, state) {
                          state.maybeWhen(orElse: () {
                            setState(() {});
                          });
                        },
                      ),
                    ],
                    child: _buildBody(state, true),
                  ),
                ])),
          ),
        );
      },
    );
  }

  Widget _buildBody(FeedType type, bool isFollowing) {
    if (isFollowing) {
      return _buildFollowingFeeds(type);
    }
    return _buildFeeds();
  }

  RefreshIndicator _buildFeeds() {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<GetAllFeedsBloc>(context)
            .add(const GetAllFeedsEvent.getAllFeeds());
      },
      child: BlocBuilder<GetAllFeedsBloc, GetAllFeedsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: Text("Initial"),
              );
            },
            loading: () => _buildShimmeringBody(),
            error: (message) {
              if (message ==
                  "This feature is only available for female users") {
                return _buildNowherErrorWidget();
              }
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                      child: Text(
                    message,
                    style: titleProximaNovaTextStyle,
                  )),
                ),
              );
            },
            loaded: (data) {
              if (data.data!.isEmpty) {
                return Column(
                  children: [
                    _PostFeedCard(context),
                    SizedBox(
                      height: 40,
                    ),
                    _buildEmptyFeedWidget(),
                  ],
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: boxColor,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.data!.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed("post-feed");
                      },
                      child: BlocBuilder<GetUserBloc, GetUserState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return CreatePostCard(
                                image: " ",
                              );
                            },
                            loaded: (data) {
                              return CreatePostCard(
                                image: data.profilePhoto != null
                                    ? "${baseUrl}${data.profilePhoto}"
                                    : " ",
                              );
                            },
                          );
                        },
                      ),
                    );
                  }

                  return GestureDetector(
                    onTap: () {
                      context.pushNamed("detail-feed",
                          extra: data.data![index - 1]);
                    },
                    child: FeedCard(
                      moreOnTap: () => showMoreMenuFeed(
                          widget.parentKey.currentContext!,
                          data.data![index - 1].user!.username!),
                      shareOnTap: () =>
                          showShareMenuFeed(widget.parentKey.currentContext!),
                      data: data.data![index - 1],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyFeedWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to Nowdots",
            style: titleProximaNovaTextStyle.copyWith(fontSize: 20),
          ),
          Text(
              "This is the perfect spot to stay updated on what's going on around you. Start following people and topics that interest you right now.",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 14, color: thirdColor)),
          SizedBox(
            height: 28,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Start Following",
                style: titleProximaNovaTextStyle.copyWith(
                    fontSize: 16, color: Colors.white),
              ))
        ],
      ),
    );
  }

  Container _buildNowherErrorWidget() {
    return Container(
      padding: EdgeInsets.only(left: 55, right: 55, top: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "😔",
            style: TextStyle(fontSize: 50),
          ),
          Icon(
            Icons.lock,
            size: 50,
          )
        ]),
        SizedBox(
          height: 24,
        ),
        Text(
            "I'm sorry, Nowher is exclusively accessible to verified female users.",
            style: titleSegoeUITextStyle.copyWith(
              fontSize: 22,
              color: primaryColor,
            )),
        SizedBox(
          height: 15,
        ),
        Text(
          "Don't be sad, there are still 5 pages accessible for everyone! If you think this is a mistake please let us know.",
          style:
              regularSegoeUITextStyle.copyWith(fontSize: 15, color: subColor),
        )
      ]),
    );
  }

  RefreshIndicator _buildFollowingFeeds(FeedType type) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<GetAllFollowingFeedsBloc>(context)
            .add(GetAllFollowingFeedsEvent.getAllFollowingFeeds(type));
      },
      child: BlocBuilder<GetAllFollowingFeedsBloc, GetAllFollowingFeedsState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: Text("Initial"),
              );
            },
            loading: () => _buildShimmeringBody(),
            error: (message) {
              if (message ==
                  "This feature is only available for female users") {
                return _buildNowherErrorWidget();
              }
              return Center(
                  child: Text(
                message,
                style: titleProximaNovaTextStyle,
              ));
            },
            loaded: (data) {
              if (data.data!.isEmpty) {
                return Column(
                  children: [
                    _PostFeedCard(context),
                    SizedBox(
                      height: 40,
                    ),
                    _buildEmptyFeedWidget(),
                  ],
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: boxColor,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.data!.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _PostFeedCard(context);
                  }

                  return GestureDetector(
                    onTap: () {
                      context.pushNamed("detail-feed",
                          extra: data.data![index - 1]);
                    },
                    child: FeedCard(
                      moreOnTap: () => showMoreMenuFeed(
                          widget.parentKey.currentContext!,
                          data.data![index - 1].user!.username!),
                      shareOnTap: () =>
                          showShareMenuFeed(widget.parentKey.currentContext!),
                      data: data.data![index - 1],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  GestureDetector _PostFeedCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed("post-feed");
      },
      child: BlocBuilder<GetUserBloc, GetUserState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return CreatePostCard(
                image: " ",
              );
            },
            loaded: (data) {
              return CreatePostCard(
                image: data.profilePhoto != null
                    ? "${baseUrl}${data.profilePhoto}"
                    : " ",
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildShimmeringBody() {
    return Shimmer(
      gradient: shimmerGradient,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const LoadingFeedCard();
          },
          separatorBuilder: (context, index) => Divider(
                color: boxColor,
              ),
          itemCount: 10),
    );
  }
}

class CreatePostCard extends StatelessWidget {
  final String image;
  const CreatePostCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 21),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarCacheImage(
            image: image,
            radius: 25,
          ),
          const SizedBox(
            width: 9,
          ),
          Text(
            "Create Post",
            style: regularSegoeUITextStyle.copyWith(
                fontSize: 15, color: thirdColor),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.image_outlined))
        ],
      ),
    );
  }
}

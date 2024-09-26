import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/bloc/get_user/get_user_bloc.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_button/share_menu_feed.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_card.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/loading_feed_card.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/score_widget.dart';
import 'package:nowdots_social_news/src/presentation/profile/widgets/more_menu_profile_feed.dart';
import 'package:shimmer/shimmer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              customAppbar(context),
              PinnedHeaderSliver(
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                      labelStyle: titleSegoeUITextStyle.copyWith(fontSize: 15),
                      labelColor: primaryColor,
                      unselectedLabelColor: thirdColor,
                      dividerColor: boxColor,
                      indicatorColor: primaryColor,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      tabs: const [
                        Tab(
                          text: "Post",
                        ),
                        Tab(
                          text: "Replies",
                        ),
                        Tab(
                          text: "Stories",
                        ),
                        Tab(
                          text: "Media",
                        ),
                        Tab(text: "Following"),
                      ]),
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            _buildBody(),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<GetUserBloc>(context)
            .add(const GetUserEvent.getLocalUser());
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
            error: (message) => Text(message),
            loaded: (data) {
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: boxColor,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed("detail-feed",
                          extra: data.data![index]);
                    },
                    child: FeedCard(
                      moreOnTap: () => showMoreMenuProfileFeed(context),
                      shareOnTap: () => showShareMenuFeed(context),
                      data: data.data![index],
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

Widget customAppbar(BuildContext context) {
  return SliverAppBar(
      forceElevated: false,
      pinned: true,
      expandedHeight: 380,
      backgroundColor: primaryColor,
      stretch: true,
      elevation: 0,
      leading: IconButton.filled(
        style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(primaryColor.withOpacity(0.8))),
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          bool isAppBarExpanded = constraints.maxHeight >
              kToolbarHeight + MediaQuery.of(context).padding.top;
          return FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: buildBanner(),
            title: isAppBarExpanded
                ? SizedBox()
                : BlocBuilder<GetUserBloc, GetUserState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Text(
                            "name",
                            style: titleSegoeUITextStyle.copyWith(
                                fontSize: 20, color: Colors.white),
                          );
                        },
                        loaded: (data) => Text(
                          "${data.name}",
                          style: titleSegoeUITextStyle.copyWith(
                              fontSize: 20, color: Colors.white),
                        ),
                      );
                    },
                  ),
          );
        },
      ));
}

Widget buildBanner() {
  return Container(
    color: Colors.white,
    child: Stack(
      children: [
        CachedNetworkImage(
          imageUrl: "https://picsum.photos/1200/600",
          imageBuilder: (context, imageProvider) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              padding: EdgeInsets.only(right: 21, left: 8),
              decoration: BoxDecoration(
                  color: boxColor,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
              child: SafeArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Edit profile",
                                style: subtitleProximaNovaTextStyle.copyWith(
                                    fontSize: 15, color: Colors.white),
                              )),
                        ),
                      ),
                    ]),
              ),
            );
          },
          placeholder: (context, url) {
            return Shimmer(
              gradient: shimmerGradient,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                padding: EdgeInsets.symmetric(horizontal: 21),
                decoration: BoxDecoration(
                  color: boxColor,
                ),
                child: SafeArea(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: GestureDetector(
                            onTap: () => context.pop(),
                            child: CircleAvatar(
                              backgroundColor: Colors.black87,
                              child: Center(
                                  child: Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.white,
                              )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit profile",
                                  style: subtitleProximaNovaTextStyle.copyWith(
                                      fontSize: 15, color: Colors.white),
                                )),
                          ),
                        ),
                      ]),
                ),
              ),
            );
          },
          errorWidget: (context, url, error) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              padding: EdgeInsets.symmetric(horizontal: 21),
              decoration: BoxDecoration(
                color: boxColor,
              ),
              child: SafeArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: CircleAvatar(
                            backgroundColor: Colors.black87,
                            child: Center(
                                child: Icon(
                              Icons.arrow_back_outlined,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Edit profile",
                                style: subtitleProximaNovaTextStyle.copyWith(
                                    fontSize: 15, color: Colors.white),
                              )),
                        ),
                      ),
                    ]),
              ),
            );
          },
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<GetUserBloc, GetUserState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 44,
                                  child: AvatarCacheImage(
                                    image: " ",
                                    radius: 40,
                                  ),
                                );
                              },
                              loaded: (data) => CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 44,
                                child: AvatarCacheImage(
                                  image: "$baseUrl${data.profilePhoto}",
                                  radius: 40,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<GetUserBloc, GetUserState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () => Text(
                                      "name",
                                      style: titleSegoeUITextStyle.copyWith(
                                          fontSize: 20),
                                    ),
                                    loaded: (data) => Text(
                                      "${data.name}",
                                      style: titleSegoeUITextStyle.copyWith(
                                          fontSize: 20),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              BlocBuilder<GetUserBloc, GetUserState>(
                                builder: (context, state) {
                                  return state.maybeWhen(
                                    orElse: () => Text(
                                      "@username",
                                      style: regularSegoeUITextStyle.copyWith(
                                          fontSize: 14, color: subColor),
                                    ),
                                    loaded: (data) => Text(
                                      "@${data.username}",
                                      style: regularSegoeUITextStyle.copyWith(
                                          fontSize: 14, color: subColor),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40, top: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rep Score",
                            style:
                                subtitleSegoeUITextStyle.copyWith(fontSize: 14),
                          ),
                          BlocBuilder<GetUserBloc, GetUserState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return Text(
                                    "TBD",
                                    style: titleSegoeUITextStyle.copyWith(
                                        fontSize: 30, color: primaryColor),
                                  );
                                },
                                loaded: (data) {
                                  return Text(
                                    data.profile?.repScore.toString() ?? "TBD",
                                    style: titleSegoeUITextStyle.copyWith(
                                        fontSize: 30,
                                        color: repScoreColor(
                                            data.profile?.repScore ?? null)),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.only(left: 4),
                  child: Column(
                    children: [
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: regularSegoeUITextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.place,
                                size: 17,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Moscow, Russia",
                                style: regularSegoeUITextStyle.copyWith(
                                    color: subColor, fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.language,
                                size: 17,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Indonesian, English",
                                style: regularSegoeUITextStyle.copyWith(
                                    color: subColor, fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "234",
                                style: titleSegoeUITextStyle.copyWith(
                                    fontSize: 14),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Following",
                                style: regularSegoeUITextStyle.copyWith(
                                    color: subColor, fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "1321",
                                style: titleSegoeUITextStyle.copyWith(
                                    fontSize: 14),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Follower",
                                style: regularSegoeUITextStyle.copyWith(
                                    color: subColor, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

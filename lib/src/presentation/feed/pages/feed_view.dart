import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/bloc/get_user/get_user_bloc.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/logos.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';
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
  String getLogo(int index) {
    switch (index) {
      case 0:
        return nowdotsLogo;
      case 1:
        return nowherLogo;
      case 2:
        return nowfoodieLogo;
      case 3:
        return nowplayLogo;
      case 4:
        return nowsportsLogo;
      case 5:
        return nowhypeLogo;
      default:
        return nowdotsLogo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, int>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
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
              bottom: const TabBar(tabs: [
                Tab(
                  text: "For You",
                ),
                Tab(
                  text: "Following",
                )
              ]),
            ),
            body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [_buildBody(), _buildShimmeringBody()]),
          ),
        );
      },
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
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
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
            ),
            Divider(
              color: boxColor,
            ),
            BlocBuilder<GetAllFeedsBloc, GetAllFeedsState>(
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
                      itemCount: data.data!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed("detail-feed",
                                extra: data.data![index]);
                          },
                          child: FeedCard(
                            data: data.data![index],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
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

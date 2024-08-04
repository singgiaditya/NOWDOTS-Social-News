import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/constant/logos.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/data/models/auth/user_model.dart';
import 'package:nowdots_social_news/src/injection_container.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/drawer/drawer_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/bloc/get_all_feeds/get_all_feeds_bloc.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/feed_card.dart';
import 'package:nowdots_social_news/src/presentation/feed/widgets/loading_feed_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class FeedView extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentKey;
  const FeedView({super.key, required this.parentKey});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  UserModel userModel = UserModel();
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

  void getUser() async {
    final SharedPreferences prefs = sl();
    String? user = await prefs.getString("user");
    userModel = UserModel.fromRawJson(user!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUser();
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
                children: [_buildBody(userModel), _buildShimmeringBody()]),
          ),
        );
      },
    );
  }

  Widget _buildBody(UserModel userModel) {
    return RefreshIndicator(
      onRefresh: () async {
        getUser();
        BlocProvider.of<GetAllFeedsBloc>(context)
            .add(GetAllFeedsEvent.getAllFeeds());
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            CreatePostCard(
              image: userModel.profilePhoto != null
                  ? "${baseUrl}${userModel.profilePhoto}"
                  : " ",
            ),
            Divider(
              color: boxColor,
            ),
            BlocBuilder<GetAllFeedsBloc, GetAllFeedsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Center(
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
                      physics: NeverScrollableScrollPhysics(),
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
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return LoadingFeedCard();
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
    print(image);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 21, horizontal: 21),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarCacheImage(
            image: image,
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

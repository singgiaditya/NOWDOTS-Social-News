import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/bloc/get_user/get_user_bloc.dart';
import 'package:nowdots_social_news/src/core/constant/api.dart';
import 'package:nowdots_social_news/src/core/utils/image_picker_gallery_camera.dart';
import 'package:nowdots_social_news/src/core/widgets/avatar_cache_image.dart';
import 'package:nowdots_social_news/src/data/datasources/local/recent_photos/local_recent_photos.dart';

class PostFeed extends StatefulWidget {
  const PostFeed({super.key});

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  List<Widget> widgets = [];
  List<File>? recentImages;
  List<File>? imagesSelected;
  bool isImagePressed = false;
  bool isPollingPressed = false;
  PollingWidget pollingWidget = PollingWidget();

  void pollingPressed() {
    if (!isPollingPressed) {
      widgets.add(pollingWidget);
    } else {
      for (var i = 0; i < widgets.length; i++) {
        if (widgets[i] == pollingWidget) {
          widgets.removeAt(i);
          break;
        }
      }
    }
    isPollingPressed = !isPollingPressed;
    setState(() {});
  }

  void imageSelected(File image) {
    if (imagesSelected == null) {
      imagesSelected = [];
    }
    imagesSelected!.add(image);
    setState(() {});
  }

  void deleteImageSelected(int index) {
    imagesSelected!.removeAt(index);
    setState(() {});
  }

  void recentImage() async {
    var recentPhotos = await LocalRecentPhotos.getRecentPhotos(6);
    recentImages = [];
    recentPhotos.forEach((photos) async {
      final file = await photos.loadFile();
      recentImages?.add(file!);
    });
  }

  @override
  void initState() {
    recentImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 21),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 21),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                context.pop();
                              },
                              child: Text(
                                "Cancel",
                                style: subtitleProximaNovaTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              )),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                                onPressed: null,
                                child: Text(
                                  "Post",
                                  style: subtitleProximaNovaTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 21),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<GetUserBloc, GetUserState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () {
                                  return AvatarCacheImage(image: " ");
                                },
                                loaded: (data) {
                                  return AvatarCacheImage(
                                      image: "$baseUrl${data.profilePhoto}");
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Flexible(
                              child: Column(
                            children: [
                              TextField(
                                maxLines: null,
                                style: regularSegoeUITextStyle.copyWith(
                                    fontSize: 15, color: primaryColor),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: "Create Post",
                                    hintStyle: regularSegoeUITextStyle.copyWith(
                                        fontSize: 15, color: thirdColor)),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: widgets.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return widgets[index];
                                },
                              ),
                              SizedBox(
                                height: widgets.isEmpty ? 0 : 12,
                              ),
                              SizedBox(
                                height: 220,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: imagesSelected?.length ?? 0,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 7,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                        height: 220,
                                        width: 147,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                image: FileImage(
                                                    imagesSelected![index]),
                                                fit: BoxFit.cover)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () =>
                                                  deleteImageSelected(index),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.black
                                                    .withOpacity(0.5),
                                                radius: 14,
                                                child: Center(
                                                  child: Icon(
                                                    Icons.clear_outlined,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ));
                                  },
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isImagePressed,
              child: Container(
                height: 71,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      recentImages != null ? recentImages!.length + 2 : 0,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () async {
                          final imageTemp = await ImagePickerGalleryCamera
                              .pickImageFromCamera(context);

                          imageSelected(File(imageTemp!.path));

                          setState(() {});
                        },
                        child: Container(
                          width: 71,
                          height: 71,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: boxColor, width: 2)),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: primaryColor,
                            size: 40,
                          ),
                        ),
                      );
                    }
                    if (index == recentImages!.length + 1) {
                      return GestureDetector(
                        onTap: () async {
                          List<XFile>? imagesTemp =
                              await ImagePickerGalleryCamera
                                  .pickMultiImageFromGallery();
                          if (imagesTemp == null) {
                            return;
                          }

                          imagesTemp.forEach((image) {
                            imageSelected(File(image.path));
                          });

                          setState(() {});
                        },
                        child: Container(
                          width: 71,
                          height: 71,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: boxColor, width: 2)),
                          child: Icon(
                            Icons.image_outlined,
                            color: primaryColor,
                            size: 40,
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () => imageSelected(recentImages![index - 1]),
                      child: Container(
                        width: 71,
                        height: 71,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: FileImage(recentImages![index - 1]),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(
              color: boxColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.white,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                  "Who can see this post?",
                                  style: subtitleSegoeUITextStyle.copyWith(
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Choose who can see your posts. Keep in mind that interactions on anonymous posts will not affect your reputation score.",
                                  style: regularSegoeUITextStyle.copyWith(
                                      color: subColor, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                PostTypeWidget(
                                    icon: Icons.language_outlined,
                                    isVisible: true,
                                    label: "Everyone"),
                                SizedBox(
                                  height: 16,
                                ),
                                PostTypeWidget(
                                    isVisible: false,
                                    icon: Icons.question_mark,
                                    label: "Anonymous"),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.language_outlined,
                          color: subColor,
                          size: 16,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Everyone",
                          style: regularSegoeUITextStyle.copyWith(
                              fontSize: 14, color: subColor),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: boxColor,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            // List<XFile>? imagesTemp =
                            //     await ImagePickerGalleryCamera
                            //         .pickMultiImageFromGallery();
                            // if (imagesTemp == null) {
                            //   return;
                            // }
                            // if (images == null) {
                            //   images = imagesTemp;
                            // } else {
                            //   images!.addAll(imagesTemp);
                            // }

                            isImagePressed = !isImagePressed;
                            setState(() {});
                          },
                          child: Icon(
                            Icons.image_outlined,
                            color: isImagePressed ? buttonColor : primaryColor,
                          )),
                      SizedBox(
                        width: 19,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.gif_box_outlined)),
                      SizedBox(
                        width: 19,
                      ),
                      GestureDetector(
                          onTap: () {
                            pollingPressed();
                          },
                          child: Icon(
                            Icons.poll_outlined,
                            color:
                                isPollingPressed ? buttonColor : primaryColor,
                          )),
                      SizedBox(
                        width: 19,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.emoji_emotions_outlined)),
                      SizedBox(
                        width: 19,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.calendar_month_outlined)),
                      SizedBox(
                        width: 19,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.location_on_outlined))
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: boxColor,
            )
          ],
        )),
      ),
    );
  }
}

class PollingWidget extends StatefulWidget {
  const PollingWidget({
    super.key,
  });

  @override
  State<PollingWidget> createState() => _PollingWidgetState();
}

class _PollingWidgetState extends State<PollingWidget> {
  List<TextEditingController> item = [
    TextEditingController(),
    TextEditingController()
  ];

  void addItem() {
    item.add(TextEditingController());
    setState(() {});
  }

  void removeItem(int index) {
    if (item.length == 2) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Select at least 2 options to create a poll.")));
      return;
    }
    item.removeAt(index);
    setState(() {});
  }

  bool isLast(int index) {
    return index + 1 == item.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: boxColor),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: item.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8,
                );
              },
              itemBuilder: (context, index) {
                return PollingField(
                  controller: item[index],
                  index: index,
                  isLast: isLast(index),
                  onTap: isLast(index) ? addItem : () => removeItem(index),
                );
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: boxColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Poll Length",
                    style: subtitleSegoeUITextStyle.copyWith(
                      fontSize: 16,
                    )),
                Text("1 Day",
                    style: subtitleSegoeUITextStyle.copyWith(
                        fontSize: 16, color: thirdColor))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PollingField extends StatelessWidget {
  final int index;
  final bool isLast;
  final void Function() onTap;
  final TextEditingController controller;
  const PollingField({
    super.key,
    required this.index,
    required this.isLast,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
            child: SizedBox(
          height: 44,
          child: TextField(
            controller: controller,
            style: regularSegoeUITextStyle.copyWith(
                fontSize: 15, color: primaryColor),
            decoration: InputDecoration(
                hintText: "Choice ${index + 1}",
                hintStyle: regularSegoeUITextStyle.copyWith(
                    fontSize: 15, color: thirdColor),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: boxColor),
                    borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: boxColor),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: boxColor),
                    borderRadius: BorderRadius.circular(8))),
          ),
        )),
        SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: isLast ? buttonColor : primaryColor,
            radius: 13,
            child: Icon(
              isLast ? Icons.add : Icons.clear_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class PostTypeWidget extends StatelessWidget {
  final bool isVisible;
  final IconData icon;
  final String label;

  const PostTypeWidget({
    super.key,
    required this.isVisible,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: boxColor,
                child: Icon(
                  icon,
                  color: subColor,
                  size: 30,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10,
                      child: Icon(
                        Icons.check_circle,
                        color: buttonColor,
                        size: 20,
                      ))),
            ),
          ],
        ),
        SizedBox(
          width: 11,
        ),
        Text(
          label,
          style: subtitleProximaNovaTextStyle.copyWith(fontSize: 18),
        )
      ],
    );
  }
}

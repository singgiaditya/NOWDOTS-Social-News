import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/constant/images.dart';
import 'package:nowdots_social_news/src/core/utils/image_picker_gallery_camera.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_profile_picture/register_set_profile_picture_request_model.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_profile_picture/register_set_profile_picture_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class SignUpPickPictureView extends StatefulWidget {
  const SignUpPickPictureView({super.key});

  @override
  State<SignUpPickPictureView> createState() => _SignUpPickPictureViewState();
}

void _showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}

class _SignUpPickPictureViewState extends State<SignUpPickPictureView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  XFile? image;

  SingleChildScrollView _buildBody(BuildContext context) {
    final String email = GoRouterState.of(context).extra as String;
    return SingleChildScrollView(
      child: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            LogoList(),
            SizedBox(
              height: 48,
            ),
            Text(
              "Pick your profile picture",
              style: titleProximaNovaTextStyle.copyWith(
                  fontSize: 26, fontWeight: FontWeight.w600),
            ),
            Text(
              "Make sure it's your best one",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 13, color: subColor),
            ),
            SizedBox(
              height: 29,
            ),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: image != null
                        ? FileImage(File(image!.path))
                        : AssetImage(anonymousAvatar),
                    radius: 100,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: GestureDetector(
                      onTap: () async {
                        image = await ImagePickerGalleryCamera
                            .pickImageFromGalleryOrCamera(context);
                        if (image != null) {
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: buttonColor,
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 29,
            ),
            BlocConsumer<RegisterSetProfilePictureBloc,
                RegisterSetProfilePictureState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  error: (message) => _showSnackBar(message, context),
                  loaded: (data) {
                    print(data.data);
                    context.goNamed("sign-up-pick-username", extra: email);
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return _buildNextButton(email, context);
                  },
                  error: (message) => _buildNextButton(email, context),
                  loaded: (data) => _buildNextButton(email, context),
                  loading: () => _buildLoadingNextButton(),
                );
              },
            ),
            SizedBox(
              height: 18,
            ),
            BlocBuilder<RegisterSetProfilePictureBloc,
                RegisterSetProfilePictureState>(
              builder: (context, state) {
                return state.maybeWhen(
                    orElse: () => _buildSkipButton(email, context),
                    loading: () => _buildSkipButton(email, context),
                    error: (message) => _buildSkipButton(email, context),
                    loaded: (data) => _buildSkipButton(email, context));
              },
            ),
          ],
        ),
      )),
    );
  }

  GestureDetector _buildSkipButton(String email, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<RegisterSetProfilePictureBloc>()
          ..add(RegisterSetProfilePictureEvent.skipProfilePicture(email));
      },
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            border: Border.all(color: boxColor, width: 2),
          ),
          child: Center(
            child: Text(
              "Skip for now",
              style: subtitleProximaNovaTextStyle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
          )),
    );
  }

  GestureDetector _buildLoadingSkipButton() {
    return GestureDetector(
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            border: Border.all(color: boxColor, width: 2),
          ),
          child: Center(
              child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          ))),
    );
  }

  SizedBox _buildNextButton(String email, BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: image != null
              ? () {
                  final requestData = RegisterSetProfilePictureRequestModel(
                      email: email, image: File(image!.path));
                  context.read<RegisterSetProfilePictureBloc>()
                    ..add(RegisterSetProfilePictureEvent.setProfilePicture(
                        requestData));
                }
              : null,
          child: Text(
            "Next",
            style: subtitleProximaNovaTextStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )),
    );
  }

  SizedBox _buildLoadingNextButton() {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: null,
          child: Center(
              child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          ))),
    );
  }
}

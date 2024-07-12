import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class SignUpPickPictureView extends StatelessWidget {
  const SignUpPickPictureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
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
                    backgroundImage: NetworkImage(
                        "https://planetsains.com/wp-content/uploads/2022/09/anonymous-avatar-icon-25.png"),
                    radius: 100,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 29,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    "Next",
                    style: subtitleProximaNovaTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )),
            ),
            SizedBox(
              height: 18,
            ),
            GestureDetector(
              onTap: () {
                context.goNamed("sign-up-pick-username");
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
            ),
          ],
        ),
      )),
    );
  }
}

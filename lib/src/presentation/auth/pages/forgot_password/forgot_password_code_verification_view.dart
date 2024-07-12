import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class ForgotPasswordCodeVerificationView extends StatefulWidget {
  const ForgotPasswordCodeVerificationView({super.key});

  @override
  State<ForgotPasswordCodeVerificationView> createState() =>
      _ForgotPasswordCodeVerificationViewState();
}

class _ForgotPasswordCodeVerificationViewState
    extends State<ForgotPasswordCodeVerificationView> {
  bool isValid = false;
  String code = "";

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
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              LogoList(),
              SizedBox(
                height: 93,
              ),
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We sent you a code",
                    style: titleProximaNovaTextStyle.copyWith(
                        fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Check your email bs*****@g****.*** to get your confirmation code. If you didn’t receive any mail, you can request to resend the email.",
                    style: regularSegoeUITextStyle.copyWith(
                        fontSize: 13, color: subColor),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  OtpTextField(
                    focusedBorderColor: primaryColor,
                    numberOfFields: 6,
                    keyboardType: TextInputType.number,
                    textStyle: subtitleSegoeUITextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 30),
                    onCodeChanged: (value) {
                      setState(() {
                        code = value;
                        isValid = code.length == 6;
                      });
                    },
                    onSubmit: (value) {
                      setState(() {
                        code = value;
                        isValid = code.length == 6;
                      });
                    },
                  ),
                ],
              )),
              SizedBox(
                height: 150,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Didn't receive email? ",
                          style: regularSegoeUITextStyle.copyWith(
                              color: thirdColor, fontSize: 11),
                          children: [
                        TextSpan(
                          text: "Resend email",
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: regularSegoeUITextStyle.copyWith(
                              color: buttonColor, fontSize: 11),
                        )
                      ])),
                  ElevatedButton(
                      onPressed: isValid
                          ? () {
                              context.goNamed("forgot-password-new-password");
                            }
                          : null,
                      child: Text(
                        "Next",
                        style: subtitleProximaNovaTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/verification_code/register_verification_code_request_model.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_code_verification/register_code_verification_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class SignUpCodeVerificationView extends StatefulWidget {
  const SignUpCodeVerificationView({super.key});

  @override
  State<SignUpCodeVerificationView> createState() =>
      _SignUpCodeVerificationViewState();
}

class _SignUpCodeVerificationViewState
    extends State<SignUpCodeVerificationView> {
  bool isValid = false;
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    final String email = GoRouterState.of(context).extra! as String;
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
                    "Enter it below to verify $email",
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
                  BlocConsumer<RegisterCodeVerificationBloc,
                      RegisterCodeVerificationState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        error: (message) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(message)));
                        },
                        loaded: (data) {
                          context.goNamed("sign-up-create-password",
                              extra: email);
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => _buildNextButton(context, email),
                        error: (message) => _buildNextButton(context, email),
                        loading: () => _buildLoadingButton(),
                        loaded: (data) {
                          return _buildNextButton(context, email);
                        },
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildLoadingButton() {
    return ElevatedButton(
        onPressed: null,
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(),
        ));
  }

  ElevatedButton _buildNextButton(BuildContext context, String email) {
    return ElevatedButton(
        onPressed: isValid
            ? () {
                var requestData = RegisterVerificationCodeRequestModel(
                    email: email, code: code);
                context.read<RegisterCodeVerificationBloc>()
                  ..add(RegisterCodeVerificationEvent.codeVerification(
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
        ));
  }
}

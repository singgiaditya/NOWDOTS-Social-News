import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/utils/input_validator.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_password/register_set_password_request_model.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_password/register_set_password_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class SignUpCreatePasswordView extends StatefulWidget {
  const SignUpCreatePasswordView({super.key});

  @override
  State<SignUpCreatePasswordView> createState() =>
      _SignUpCreatePasswordViewState();
}

class _SignUpCreatePasswordViewState extends State<SignUpCreatePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;
  bool isValid = false;

  void onChangeTextField(String value) {
    setState(() {
      if (_formKey.currentState!.validate()) {
        isValid = true;
      } else {
        isValid = false;
      }
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

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
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your password",
                      style: titleProximaNovaTextStyle.copyWith(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Make sure it's 8 character or more.",
                      style: regularSegoeUITextStyle.copyWith(
                          fontSize: 13, color: subColor),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      onChanged: (value) => onChangeTextField(value),
                      validator: (value) =>
                          InputValidator.validateInputPassword(value),
                      obscureText: isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: thirdColor,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    _buildAgreements(),
                    SizedBox(
                      height: 26,
                    ),
                    BlocConsumer<RegisterSetPasswordBloc,
                        RegisterSetPasswordState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          error: (message) {
                            _showSnackBar(message);
                          },
                          loaded: (data) {
                            context.goNamed("sign-up-pick-picture",
                                extra: email);
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return _buildButtonNext(email, context);
                          },
                          loading: () {
                            return Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                    onPressed: null,
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    )));
                          },
                          error: (message) => _buildButtonNext(email, context),
                          loaded: (data) => _buildButtonNext(email, context),
                        );
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildButtonNext(String email, BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: isValid
              ? () {
                  RegisterSetPasswordRequestModel requestData =
                      RegisterSetPasswordRequestModel(
                          password: _passwordController.text, email: email);
                  context
                      .read<RegisterSetPasswordBloc>()
                      .add(RegisterSetPasswordEvent.setPassword(requestData));
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

  RichText _buildAgreements() {
    return RichText(
      text: TextSpan(
          text: "By registering, you accept our ",
          style:
              regularSegoeUITextStyle.copyWith(fontSize: 11, color: thirdColor),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "Terms of Service",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: buttonColor),
            ),
            TextSpan(text: " and "),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "Privacy Policy",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: buttonColor),
            ),
            TextSpan(text: ",which includes the "),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "Cookie Use.",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: buttonColor),
            ),
            TextSpan(
                text:
                    " NOWDOTS may use your contact information, such as your email address and phone number, for purposes detailed in our Privacy Policy, such as recurring your account and personalizing our services, including advertisements. "),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "Learn more.",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: buttonColor),
            ),
            TextSpan(text: " unless you opt-out "),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () {},
              text: "here",
              style: regularSegoeUITextStyle.copyWith(
                  fontSize: 11, color: buttonColor),
            ),
            TextSpan(
                text:
                    " others can locate you by your email or phone number if provided"),
          ]),
    );
  }
}

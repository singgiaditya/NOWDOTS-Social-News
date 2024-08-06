import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/utils/input_validator.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/set_new_password/forgot_password_set_new_password_request_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/verification/forgot_password_verification_response_model.dart';
import 'package:nowdots_social_news/src/data/models/auth/login/login_request_model.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/forgot_password/forgot_password_set_new_password/forgot_password_set_new_password_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class ForgotPasswordNewPasswordView extends StatefulWidget {
  const ForgotPasswordNewPasswordView({super.key});

  @override
  State<ForgotPasswordNewPasswordView> createState() =>
      _ForgotPasswordNewPasswordViewState();
}

class _ForgotPasswordNewPasswordViewState
    extends State<ForgotPasswordNewPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  bool isObscure = true;
  bool isObscure2 = true;
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

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    final ForgotPasswordVerificationCodeResponseModel data =
        GoRouterState.of(context).extra
            as ForgotPasswordVerificationCodeResponseModel;
    return SingleChildScrollView(
        child: SafeArea(
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 37),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 40,
            ),
            LogoList(),
            SizedBox(
              height: 50,
            ),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose a new password",
                      style: titleProximaNovaTextStyle.copyWith(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Make sure your new password is 8 characters or more. Try including numbers, letters, and punctuation marks for a strong password.\n\nYou'll be logged out from any other devices connected to the account after your password is changed.",
                      style: regularSegoeUITextStyle.copyWith(
                          fontSize: 13, color: subColor),
                    ),
                    SizedBox(
                      height: 33,
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
                    TextFormField(
                      controller: _passwordConfirmController,
                      onChanged: (value) => onChangeTextField(value),
                      validator: (value) =>
                          InputValidator.validateInputPasswordConfirm(
                              _passwordController.text, value),
                      obscureText: isObscure2,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure2 = !isObscure2;
                              });
                            },
                            icon: Icon(
                              isObscure2
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: thirdColor,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    BlocConsumer<ForgotPasswordSetNewPasswordBloc,
                        ForgotPasswordSetNewPasswordState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          loaded: (dataResponse) {
                            final LoginRequestModel requestData =
                                LoginRequestModel(
                                    emailOrUsername: data.email,
                                    password: _passwordController.text);
                            context.goNamed("forgot-password-complete",
                                extra: requestData);
                          },
                          error: (message) => showSnackBar(context, message),
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                            orElse: () => _buildNextButton(data, context),
                            loaded: (dataResponse) =>
                                _buildNextButton(data, context),
                            loading: () => _buildLoadingNextButton());
                      },
                    )
                  ],
                ))
          ])),
    ));
  }

  Align _buildNextButton(
      ForgotPasswordVerificationCodeResponseModel data, BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: isValid
              ? () {
                  final requestData = ForgotPasswordSetNewPasswordRequestModel(
                      email: data.email,
                      password: _passwordController.text,
                      passwordConfirmation: _passwordConfirmController.text);
                  context.read<ForgotPasswordSetNewPasswordBloc>().add(
                      ForgotPasswordSetNewPasswordEvent.setNewPassword(
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

  Align _buildLoadingNextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: null,
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(),
          )),
    );
  }
}

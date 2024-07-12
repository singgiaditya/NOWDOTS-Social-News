import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/utils/input_validator.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController _emailOrUsernameController =
      TextEditingController();

  bool isValid = false;

  void onChangeTextField(String value) {
    setState(() {
      if (_formKey1.currentState!.validate()) {
        isValid = true;
      } else {
        isValid = false;
      }
    });
  }

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
                key: _formKey1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find your nowdots account",
                      style: titleProximaNovaTextStyle.copyWith(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Enter your email or username associated with the account to change your password..",
                      style: regularSegoeUITextStyle.copyWith(
                          fontSize: 13, color: subColor),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _emailOrUsernameController,
                      onChanged: (value) => onChangeTextField(value),
                      validator: InputValidator.validateInputEmailOrUsername,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Email or username",
                      ),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: isValid
                              ? () {
                                  context.goNamed(
                                      "forgot-password-code-verification");
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
}

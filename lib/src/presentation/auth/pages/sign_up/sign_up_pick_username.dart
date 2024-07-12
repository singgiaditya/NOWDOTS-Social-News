import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/utils/input_validator.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class SignUpPickUsername extends StatefulWidget {
  const SignUpPickUsername({Key? key}) : super(key: key);

  @override
  State<SignUpPickUsername> createState() => _SignUpPickUsernameState();
}

class _SignUpPickUsernameState extends State<SignUpPickUsername> {
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();

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
                      "Pick your username",
                      style: titleProximaNovaTextStyle.copyWith(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Your @username will be displayed alongside your name as unique ID. you can always change it later.",
                      style: regularSegoeUITextStyle.copyWith(
                          fontSize: 13, color: subColor),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      onChanged: (value) => onChangeTextField(value),
                      validator: InputValidator.validateInputUsername,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Username",
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
                                  context.goNamed("sign-up-complete");
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

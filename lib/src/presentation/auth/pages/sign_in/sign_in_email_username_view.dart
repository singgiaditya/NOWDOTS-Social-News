import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class SignInEmailUsernameView extends StatefulWidget {
  const SignInEmailUsernameView({super.key});

  @override
  State<SignInEmailUsernameView> createState() =>
      _SignInEmailUsernameViewState();
}

class _SignInEmailUsernameViewState extends State<SignInEmailUsernameView> {
  final _formKey = GlobalKey<FormState>();
  final _inputEmailUsernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final RegExp _emailOrUsernameRegex = RegExp(
      r'^(?:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}|@[a-zA-Z0-9_]+)$');

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!_emailOrUsernameRegex.hasMatch(value)) {
      return 'Please enter a valid email or @username';
    }
    return null;
  }

  bool isNotEmpty = false;
  bool isValid = false;

  void checkInput() {
    isNotEmpty = _inputEmailUsernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  void onChangeTextField(String value) {
    setState(() {
      checkInput();
      if (_formKey.currentState!.validate() && isNotEmpty) {
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
          margin: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const LogoList(),
              const SizedBox(
                height: 80,
              ),
              Text(
                "Enter your email or username and password",
                style: titleProximaNovaTextStyle.copyWith(
                    fontSize: 26, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => onChangeTextField(value),
                      controller: _inputEmailUsernameController,
                      validator: _validateInput,
                      keyboardType: TextInputType.text,
                      decoration:
                          const InputDecoration(hintText: "Email or @username"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) => onChangeTextField(value),
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: isValid ? () {} : null,
                          child: Text(
                            "Log in",
                            style: subtitleProximaNovaTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: boxColor,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(color: boxColor, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "Forgot password",
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
        ),
      ),
    );
  }
}

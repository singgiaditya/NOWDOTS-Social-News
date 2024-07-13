import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/utils/input_validator.dart';
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

  bool isNotEmpty = false;
  bool isValid = false;
  bool isObscure = true;

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
          margin: const EdgeInsets.symmetric(horizontal: 37),
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              const LogoList(),
              const SizedBox(
                height: 83,
              ),
              Column(
                children: [
                  Text(
                    "Enter your email or username and password",
                    style: titleProximaNovaTextStyle.copyWith(
                        fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildForm(),
                  const SizedBox(
                    height: 18,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.goNamed("forgot-password");
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
            ],
          ),
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) => onChangeTextField(value),
            controller: _inputEmailUsernameController,
            validator: InputValidator.validateInputEmailOrUsername,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(hintText: "Email or @username"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
              onChanged: (value) => onChangeTextField(value),
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: isObscure,
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
                      )))),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: isValid
                    ? () {
                        context.goNamed("home");
                      }
                    : null,
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
    );
  }
}

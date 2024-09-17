import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/utils/input_validator.dart';
import 'package:nowdots_social_news/src/data/models/auth/forgot_password/forgot_pass/forgot_password_request_model.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/forgot_password/forgot_pass/forgot_pass_bloc.dart';
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
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const LogoList(),
              const SizedBox(
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
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _emailOrUsernameController,
                      onChanged: (value) => onChangeTextField(value),
                      validator: InputValidator.validateInputEmailOrUsername,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Email or username",
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    BlocConsumer<ForgotPassBloc, ForgotPassState>(
                      listener: (context, state) {
                        state.maybeWhen(
                            orElse: () {},
                            error: (message) => showSnackBar(context, message),
                            loaded: (data) {
                              context.goNamed(
                                  "forgot-password-code-verification",
                                  extra: data);
                            });
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => _buildNextButton(context),
                          error: (message) => _buildNextButton(context),
                          loaded: (data) => _buildNextButton(context),
                          loading: () => _buildLoadingNextButton(context),
                        );
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: isValid
              ? () {
                  final requestData = ForgotPasswordRequestModel(
                      emailOrUsername: _emailOrUsernameController.text);
                  context.read<ForgotPassBloc>()
                    .add(ForgotPassEvent.forgotPassword(requestData));
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

  Align _buildLoadingNextButton(BuildContext context) {
    return const Align(
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

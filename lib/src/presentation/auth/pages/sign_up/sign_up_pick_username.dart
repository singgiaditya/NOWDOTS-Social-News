import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/utils/input_validator.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/set_username_user/register_set_username_user_request_model.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/register_set_username/register_set_username_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class SignUpPickUsername extends StatefulWidget {
  const SignUpPickUsername({super.key});

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

  void _showSnackBar(String message, BuildContext context) {
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
    final email = GoRouterState.of(context).extra as String;
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
                      "Pick your username",
                      style: titleProximaNovaTextStyle.copyWith(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Your @username will be displayed alongside your name as unique ID. you can always change it later.",
                      style: regularSegoeUITextStyle.copyWith(
                          fontSize: 13, color: subColor),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      onChanged: (value) => onChangeTextField(value),
                      validator: InputValidator.validateInputUsername,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Username",
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    BlocConsumer<RegisterSetUsernameBloc,
                        RegisterSetUsernameState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          error: (message) => _showSnackBar(message, context),
                          loaded: (data) {
                            context.goNamed("sign-up-complete");
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => _buildNextButton(email, context),
                          loaded: (data) => _buildNextButton(email, context),
                          error: (message) => _buildNextButton(email, context),
                          loading: () => _buildLoadingNextButton(),
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

  Align _buildNextButton(String email, BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: isValid
              ? () {
                  final RegisterSetUsernameUserRequestModel requestData =
                      RegisterSetUsernameUserRequestModel(
                          email: email, username: _usernameController.text);
                  context.read<RegisterSetUsernameBloc>()
                    .add(RegisterSetUsernameEvent.setUsername(requestData));
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
    return const Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: null,
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )),
    );
  }
}

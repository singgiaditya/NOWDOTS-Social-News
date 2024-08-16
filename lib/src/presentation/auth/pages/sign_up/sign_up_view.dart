import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/utils/input_validator.dart';
import 'package:nowdots_social_news/src/data/models/auth/register/create_account/create_account_request_model.dart';
import 'package:nowdots_social_news/src/presentation/auth/bloc/register/create_account/create_account_bloc.dart';
import 'package:nowdots_social_news/src/presentation/auth/widgets/logo_list.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  bool isNotEmpty = false;
  bool isValid = false;
  DateTime? dob;

  void checkInput() {
    isNotEmpty = _emailController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _dateController.text.isNotEmpty;
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
          padding: const EdgeInsets.symmetric(horizontal: 37),
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create your account",
                        style: titleProximaNovaTextStyle.copyWith(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onChanged: (value) => onChangeTextField(value),
                        controller: _nameController,
                        validator: InputValidator.validateInputIsNotEmpty,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(hintText: "Name"),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        onChanged: (value) => onChangeTextField(value),
                        controller: _emailController,
                        validator: InputValidator.validateInputEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(hintText: "Email"),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextFormField(
                        controller: _dateController,
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now())
                              .then(
                            (value) {
                              if (value != null) {
                                _dateController.text =
                                    "${value.day}/${value.month}/${value.year}";
                                dob = value;
                                onChangeTextField(_dateController.text);
                              }
                            },
                          );
                        },
                        readOnly: true,
                        keyboardType: TextInputType.datetime,
                        decoration:
                            const InputDecoration(hintText: "Date of birth"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocConsumer<CreateAccountBloc, CreateAccountState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            orElse: () {},
                            error: (message) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(message)));
                            },
                            loaded: (data) {
                              context.goNamed("sign-up-code-verification",
                                  extra: data.data!.email);
                            },
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(orElse: () {
                            return _buildButtonNext(context);
                          }, loading: () {
                            return const Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                    onPressed: null,
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(),
                                    )));
                          }, error: (message) {
                            return _buildButtonNext(context);
                          }, loaded: (data) {
                            return _buildButtonNext(context);
                          });
                        },
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildButtonNext(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
            onPressed: isValid
                ? () {
                    CreateAccountRequestModel requestData =
                        CreateAccountRequestModel(
                            name: _nameController.text,
                            email: _emailController.text,
                            dob: dob);
                    context
                        .read<CreateAccountBloc>()
                        .add(CreateAccountEvent.createAccount(requestData));
                  }
                : null,
            child: Text(
              "Next",
              style: subtitleProximaNovaTextStyle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )));
  }
}

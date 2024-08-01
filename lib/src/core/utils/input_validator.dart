import 'package:nowdots_social_news/src/core/utils/regex_patterns.dart';

class InputValidator {
  static String? validateInputIsNotEmpty(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  static String? validateInputEmailOrUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!RegexPatterns.emailOrUsernameRegex.hasMatch(value)) {
      return 'Please enter a valid email or @username';
    }
    return null;
  }

  static String? validateInputEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!RegexPatterns.emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validateInputUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!RegexPatterns.usernameRegex.hasMatch(value)) {
      return 'Please enter a valid username';
    }
    return null;
  }

  static String? validateInputPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length < 8) {
      return 'Password must be 8 character or more!';
    }
    return null;
  }

  static String? validateInputPasswordConfirm(String password, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (password != value) {
      return 'Password does not match';
    }
    return null;
  }
}

class RegexPatterns {
  static final RegExp emailOrUsernameRegex = RegExp(
      r'^(?:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}|@[a-zA-Z0-9_]+)$');
  static final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final RegExp usernameRegex = RegExp(r'^@[a-zA-Z0-9_]+$');
}

class Validation {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Username";
    } else if (value.length < 4) {
      return "Username must be at least 4 characters";
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (value.isEmpty) {
      return "Enter Email";
    } else if (!emailValid) {
      return "Enter Valid Email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    RegExp passValidate =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return "Enter Password";
    }
    if (!passValidate.hasMatch(value) || value.contains(' ')) {
      return "Invalid Password";
    } else {
      return null;
    }
  }

  static String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return "Select Gender";
    } else {
      return null;
    }
  }

  static String? validateDob(String? value) {
    if (value == null || value.isEmpty) {
      return "Select Date of birth";
    } else {
      return null;
    }
  }

  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return "Select Weight";
    } else {
      return null;
    }
  }

  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return "Select Height";
    } else {
      return null;
    }
  }
}

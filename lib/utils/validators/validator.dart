class Validator {
  Validator._();

  static String? validateEmptyField(String fieldName, String? value) {
    if(value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }
  
  static String? validateEmail(String? value) {
    if(value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if(!emailRegex.hasMatch(value)) {
      return "Email email address";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if(value == null || value.isEmpty){
      return "Password is required";
    }
    if(value.length < 6) {
      return "Password must be atleast 6 characters long.";
    }
    //checks for upper case letters
    if(!value.contains(RegExp(r"[A-Z]"))) {
      return "Password must contain at least one uppercase letter.";
    }
    //checks for numbers
    if(!value.contains(RegExp(r"[0-9]"))) {
      return "Password must contain at least one number.";
    }
    //checks for special characters
    if(!value.contains(RegExp(r'[!@#$%^&*()<>?":{}|<>]'))) {
      return "Password must contain at least one special character.";
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if(value == null || value.isEmpty) {
      return "Phone number is required.";
    }
    final phoneRegExp = RegExp(r'^\d{10}$');
    if(!phoneRegExp.hasMatch(value)) {
      return "Invalid phone number format (10 digits required)";
    }
    return null;
  }
}
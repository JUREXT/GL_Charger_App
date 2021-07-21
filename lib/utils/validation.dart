class Validations {

  static RegExp nameRegExp = new RegExp(r'^[A-za-zğüşöçİĞÜŞÖÇ ]+$');
  static RegExp emailRegExp = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  static String validateUsername(String value) {
    if (value.isEmpty) return 'Username is Required!';
    if (!nameRegExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    } else
      return null;
  }

  static String validateEmail(String value, [bool isRequried = true]) {
    if (value.isEmpty && isRequried) return 'Email is required!';
    if (!emailRegExp.hasMatch(value) && isRequried) {
      return "Please provide a valid email address!";
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return 'Password is to short!';
    } else {
      return null;
    }
  }
}

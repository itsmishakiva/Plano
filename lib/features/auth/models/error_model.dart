//Model to store auth error text values
class ErrorModel {
  String? emailError;
  String? passwordError;

  ErrorModel({this.emailError, this.passwordError});

  ErrorModel copyWith({String? email, String? password}) {
    return ErrorModel(
      emailError: email ?? emailError,
      passwordError: password ?? passwordError,
    );
  }
}

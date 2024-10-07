class Password {
  String _password = '';

  Password({required String password}) : _password = password;

  String get password => _password;
  set password(String value) => _password = value;

  bool isValid() {
    if (_password.length < 8 || _password.length > 16) {
      return false;
    }

    bool hasUpperCase = _password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = _password.contains(RegExp(r'[a-z]'));
    bool hasDigit = _password.contains(RegExp(r'[0-9]'));

    return hasUpperCase && hasLowerCase && hasDigit;
  }

  @override
  String toString() {
    return 'Your Password is: $_password';
  }
}

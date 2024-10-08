import '3-util.dart';
import 'dart:convert';


// Greet user function
Future<String> greetUser() async {
  try {
    String userData = await fetchUserData();

    Map<String, dynamic> user = jsonDecode(userData);
    return 'Hello ${user['username']}';
  } catch (e) {
    return 'error caught: $e';
  }
}

Future<String> loginUser() async {
  try {
    bool isValidUser = await checkCredentials();

    if (isValidUser) {
      print('There is a user: true');
      return await greetUser();
    } else {
      print('There is a user: false');
      return 'Wrong credentials';
    }
  } catch (e) {
    return 'error caught: $e';
  }
}

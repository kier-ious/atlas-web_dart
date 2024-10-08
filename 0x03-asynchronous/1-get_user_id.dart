import '1-util.dart';
import 'dart:convert';


Future<String> getUserId() async {
  String userData = await fetchUserData();

  Map<String, dynamic> userId = jsonDecode(userData);

  return userId['id'];
}

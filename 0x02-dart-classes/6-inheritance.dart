import '6-password.dart';


class User extends Password {
  int id;
  String name;
  int age;
  double height;
  Password user_password;

  User({
        required this.id,
        required this.name,
        required this.age,
        required this.height,
        required String user_password,
      }) : user_password = Password(password: user_password),
            super(password: user_password);

  set user_password(String new_password) {
    user_password.password = new_password;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "age": age,
      "height": height,
      "user_password": user_password.password,
    };
  }

  static User fromJson(Map<dynamic, dynamic> userJson) {
    return User(
      id: userJson['id'],
      name: userJson['name'],
      age: userJson['age'],
      height: userJson['height'],
      user_password: userJson['user_password'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User(id : $id ,name: $name, age: $age, height: $height, Password: ${user_password.isValid()})';
  }
}

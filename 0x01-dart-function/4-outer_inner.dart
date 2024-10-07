void outer(String name, String id) {
  print(inner(name, id));
}

String inner(String name, String id) {
  List<String> names = name.split(' ');
  return 'Hello Agent B.${names[0]} your id is $id';
}

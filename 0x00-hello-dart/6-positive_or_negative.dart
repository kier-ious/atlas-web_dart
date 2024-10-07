void main(List<String>args) {
  int num =  int.parse(args[0]);
  print('$num is ${num > 0 ? 'positive' : num < 0 ? 'negative' : 'zero'}');
}

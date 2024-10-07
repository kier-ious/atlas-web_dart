List<double> convertToF(List<double> temperaturesInC) {
  return temperaturesInC.map((C) {
    double F = (C * 9 / 5) + 32;
    return double.parse(F.toStringAsFixed(2));
  }).toList();
}

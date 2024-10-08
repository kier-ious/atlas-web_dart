import '4-util.dart';
import 'dart:convert';


Future<double> calculateTotal() async {
  try {
    String userData = await fetchUserData();
    Map<String, dynamic> user = jsonDecode(userData);
    String userId = user['id'];

    String ordersData = await fetchUserOrders(userId);
    List<dynamic> orders = jsonDecode(ordersData) ?? [];

    if (orders.isEmpty) {
      return -1;
    }

    // Initializing start price
    double totalPrice = 0.0;
    for (String product in orders) {
      String productPriceData = await fetchProductPrice(product);
      var productPrice = jsonDecode(productPriceData);

      if (productPrice == null) {
        return -1;
      }
      if (productPrice is int) {
        productPrice = productPrice.toDouble();
      }
      // Add to total price
      totalPrice += productPrice;
    }

    return totalPrice;
  } catch (e) {
    print('Error: $e');
    return -1;
  }
}

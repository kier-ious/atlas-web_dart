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
    for (var product in orders) {
      var productPriceData = await fetchProductPrice(product);
      if (productPriceData == null) {
        print('Failed to fetch price for product: $product');
        return -1;
      }
      var productPrice = jsonDecode(productPriceData);
      if (productPrice is! num) {
        print('Invalid product price type for product: $product, received: ${productPrice.runtimeType}');
        return -1;
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

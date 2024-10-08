import '4-util.dart';
import 'dart:convert';

Future<double> calculateTotal() async {
  try {
    String userData = await fetchUserData();
    Map<String, dynamic> user = jsonDecode(userData);
    String userId = user['id'];
    print('User ID: $userId');

    String ordersData = await fetchUserOrders(userId);
    List<dynamic> orders = jsonDecode(ordersData) ?? [];
    print('Orders: $orders');

    if (orders.isEmpty) {
      print('No orders found for user: $userId');
      return -1;
    }

    double totalPrice = 0.0;
    for (var product in orders) {
      var productPriceData = await fetchProductPrice(product);
      if (productPriceData == null) {
        print('Failed to fetch price for product: $product');
        return -1;
      }

      var productPrice = jsonDecode(productPriceData);
      if (productPrice == null) {
        print('Decoded price null for product: $product');
        return -1;
      }

      if (productPrice is! num) {
        print('Invalid product price type for product: $product, received: ${productPrice.runtimeType}');
        return -1;
      }

      totalPrice += productPrice.toDouble();
    }

    return totalPrice;
  } catch (e) {
    print('Error: $e');
    return -1;
  }
}

import 'package:yumquick/features/cart/data/models/get_cart_model.dart';

class CheckoutScreenModel {
  final List<CartProduct> products;
  final double totalPrice;
  final int itemCount;

  CheckoutScreenModel({
    required this.products,
    required this.totalPrice,
    required this.itemCount,
  });
}

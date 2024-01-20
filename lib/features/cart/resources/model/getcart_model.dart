
import 'package:ecommerce_app/features/product/model/product_model.dart';
class Cart {
  final String cartId;
  final int quantity;
  final Product product;
  Cart({
    required this.cartId,
    required this.quantity,
    required this.product,
  });
factory Cart.fromMap(Map<String,dynamic>map){
  return Cart(
    cartId: map["_id"], 
    quantity: map["quantity"], 
    product: Product.fromMap(map["product"])
    );
}

}

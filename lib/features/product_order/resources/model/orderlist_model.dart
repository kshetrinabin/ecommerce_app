// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerce_app/features/cart/resources/model/getcart_model.dart';

class OrderList {
    String id;
    List<Cart> orderItems = [];
    String name;
    String address;
    String city;
    String phone;
    String status;
    int totalPrice;
    String code;
    DateTime dateOrdered;
    int quantity;

  OrderList({
    required this.id,
    required this.orderItems,
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.status,
    required this.totalPrice,
    required this.code,
    required this.dateOrdered,
    required this.quantity,
  });

 factory OrderList.fromMap(Map<String,dynamic>map){

      return OrderList(
        id: map["_id"], 
        orderItems: List.from(map["orderItems"] ?? []).map((e) =>Cart.fromMap(e)).toList(),
        name: map["full_name"],
        address: map["address"],
        city: map["city"],
        phone: map["phone"],
        status: map["status"], 
        totalPrice: map["totalPrice"], 
        code: map["code"], 
        dateOrdered: DateTime.parse(map["dateOrdered"]),
        quantity: map["quantity"]
      );

    }

}

class Product {
     String id;
     String name;
     String image;
     String brand;
     String description;
     int price;
     List<String> catagories;
     bool addedInCart;
    Product({
        required this.id,
        required this.name,
        required this.image,
        required this.brand,
        required this.description,
        required this.price,
        required this.catagories,
        required this.addedInCart
    });
  factory Product.fromMap(Map<String,dynamic>map){
    return Product(
      id: map["_id"], 
      name: map["name"],
      image: map["image"], 
      brand: map["brand"],
      description: map["description"] ?? "",
      addedInCart: map["added_in_cart"] ?? false,
      price: map["price"], 
      catagories: List.from(map["catagories"] ?? []).map((e) => e.toString()).toList()
      );
  }
  
}
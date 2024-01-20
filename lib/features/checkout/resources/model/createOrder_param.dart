// ignore_for_file: public_member_api_docs, sort_constructors_first
class CreateOrderParam {

  final String name;
  final String phone;
  final String address;
  final String city;
  CreateOrderParam({
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
  });

  factory CreateOrderParam.fromMap(Map<String,dynamic>map){
    return CreateOrderParam(
      name: map["name"], 
      phone: map["phone"],
       address: map["address"], 
       city: map["city"]
    );
  }

  Map<String,dynamic> toMap(){
   return {
	"address": address,
	"city": city,
	"phone":phone,
	"full_name": name
};
  }
}

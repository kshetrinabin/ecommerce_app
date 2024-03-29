class User {
    final String id;
    final String name;
    final String email;
    final String phone;
    final String address;
    final String profile;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.address,
        required this.profile,
    });

    factory User.fromMap(Map<String,dynamic>map){
      return User(
        id: map["_id"], 
        name: map["name"], 
        email: map["email"], 
        phone: map["phone"], 
        address: map["address"], 
        profile: map["profile"] ?? "",

      );
    }

    Map<String,dynamic> toMap(){
     return{
     "_id" : id,
     "name" : name,
      "email": email,
      "phone" : phone,
      "address" : address,
      "profile" : profile,
    };
    }
}

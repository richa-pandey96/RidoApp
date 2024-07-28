import 'package:firebase_database/firebase_database.dart';

class UserModel{
  late String ? phone;
  late String ?name;
  late String ? id;
  late String ?email;
  late String ?address;

  UserModel ({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.address
  });

  UserModel.fromSnapshot(DataSnapshot snap){
    phone=(snap.value as dynamic)["phone"];
    name=(snap.value as dynamic)["phone"];
    id=snap.key!;
    email=(snap.value as dynamic)["phone"];
    address=(snap.value as dynamic)["phone"];
  }
}
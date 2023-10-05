import 'dart:convert';

class User{
  String id;
  String fullName;
  String email;
  DateTime? birthDay;
  String? image;

  User userFromJson(String str) => User.fromJson(json.decode(str));


  User({required this.id,required this.fullName,required this.email,this.image, this.birthDay});

  factory User.fromJson(Map<String, dynamic> data) => User(
    id: data['id'].toString(),
    fullName: data['fullName'],
    email: data['email'],
    image: data['image'] == null ? null : data['image']['url'],
    birthDay: data['age'] == null ? null : DateTime.parse(data['age']),
  );
}

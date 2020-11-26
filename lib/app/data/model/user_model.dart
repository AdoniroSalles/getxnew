import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String name;
  String email;
  String url_image;

  UserModel({this.id, this.name, this.email, this.url_image});

  //Por trabalhar com firebase nao precisa converter para json
  /*
  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
  }
  */

  UserModel.fromSnapShot(User currentUser)
      : id = currentUser.uid,
        name = currentUser.displayName,
        email = currentUser.email,
        url_image = currentUser.photoURL;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "url_image": url_image,
    };
  }
}

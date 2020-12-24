import 'dart:convert';
import 'dart:async';
import 'package:flutter_loginn/api.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<Profile> ApiProfile() async {
  String apiUrl = Api.url;

  final response =
  await http.get(Api.url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('');
  }
}

class Profile {
  int id;
  String nama;
  String no_tlp_hp;
  String email;

  Profile({this.id = 0, this.nama, this.no_tlp_hp, this.email});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map["id"], nama: map["nama"], no_tlp_hp: map["no_tlp_hp"], email: map["email"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "nama": nama, "no_tlp_hp": no_tlp_hp, "email": email};
  }

  @override
  String toString() {
    return 'Profile{id: $id, "nama": nama, "no_tlp_hp": no_tlp_hp, "email": email}';
  }

}

List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
import 'dart:convert';
import 'package:flutter_lab1_authen/models/user_model.dart';
import 'package:flutter_lab1_authen/varible.dart';
import 'package:http/http.dart' as http;




class AuthService {
  void login(String user_name, String password) async {
    print(apiURL);

    final response =await http.post(Uri.parse("$apiURL/api/user/login"),
    headers: {"Content-Type":"application/json"},
    body: jsonEncode({
  "user_name":user_name,
  "password":password
  
}) );
   print(response.statusCode);
  }
    void register(String user_name, String password,String Name, String role) async {
    print(apiURL);

    final response =await http.post(Uri.parse("$apiURL/api/user/register"),
    headers: {"Content-Type":"application/json"},
    body: jsonEncode({
  "user_name":user_name,
  "password":password,
  "Name":Name,
  "role":role
  
}) );
   print(response.statusCode);
  }
}
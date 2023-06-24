import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

ApiData() async {
  var url = 'https://jsonplaceholder.typicode.com/users';
  var urlParse = Uri.parse(url);
  var response = await http.get(urlParse);
  var res = jsonDecode(response.body);
  return res;
}

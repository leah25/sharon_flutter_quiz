import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Names {
  Future<dynamic> nameList() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    var response = await http.get(url);

    var body = json.decode(response.body);

    return body;
  }
}

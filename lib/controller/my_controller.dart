import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/model.Cls.dart';
import 'package:http/http.dart' as http;

class Mycontroller with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  MySampleNewsAppApi myNewsResponse = MySampleNewsAppApi(); //model cls
  static bool isLoading = false;
  Future fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
      //q= chngable//here country=
      "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e8c8ab89a94343fdb306149805f02275",
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      print(decodedData);
      myNewsResponse = MySampleNewsAppApi.fromJson(decodedData);
      //setState(() {});
      //notifyListeners();
    } else {
      print("api failed");
    }
    isLoading = false;
    // print(response.body);
    // print(response.statusCode);
    notifyListeners();
  }
}

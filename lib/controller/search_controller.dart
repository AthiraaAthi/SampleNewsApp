import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/model.Cls.dart';
import 'package:http/http.dart' as http;

class SearchDataController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  MySampleNewsAppApi mySearchNewsResponse = MySampleNewsAppApi(); //model cls
  static bool isLoading = false;
  Future SearchData({required String SearchData}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
      "https://newsapi.org/v2/everything?domains=$SearchData&apiKey=e8c8ab89a94343fdb306149805f02275",
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      print(decodedData);
      mySearchNewsResponse = MySampleNewsAppApi.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;

    notifyListeners();
  }
  //post
}

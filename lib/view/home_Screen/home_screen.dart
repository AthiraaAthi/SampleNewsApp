//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app_api/controller/my_controller.dart';
import 'package:news_app_api/model/model.Cls.dart';
//import 'package:news_app_api/model/model.Cls.dart';
//import 'package:http/http.dart' as http;
import 'package:news_app_api/view/home_Screen/home_screen_widget.dart';
import 'package:news_app_api/view/home_Screen/second_screen.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Map<String, dynamic> decodedData = {};
  // MySampleNewsAppApi myNewsResponse = MySampleNewsAppApi();
  // fetchData() async {
  //   final url = Uri.parse(
  //       "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=e8c8ab89a94343fdb306149805f02275");
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     decodedData = jsonDecode(response.body);
  //     myNewsResponse = MySampleNewsAppApi.fromJson(decodedData);
  //     setState(() {});
  //   } else {
  //     print("api failed");
  //   }
  //   print(response.body);
  //   print(response.statusCode);
  // } //cut&pasted to controller
  MySampleNewsAppApi myNewsResponse = MySampleNewsAppApi(); //obj of model cls
  @override

  //final myhomeController = Provider.of<Mycontroller>(context);
  //cls nu agathe data ne konvrnel we have to create an obj

  void initState() {
    // TODO: implement initState
    //fetchData();
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await Provider.of<Mycontroller>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final myControllerobj =
        Provider.of<Mycontroller>(context); //obj for controller cls
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(),
                    ));
              },
              child: Icon(Icons.search))
        ],
      ),
      body: Mycontroller.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 10,
              //MySampleNewsAppApi.articles?.length??0,
              itemBuilder: (context, index) => HomeScreenwidget(
                title:
                    myControllerobj.myNewsResponse.articles?[index].title ?? "",
                des: myControllerobj
                        .myNewsResponse.articles?[index].description ??
                    "",
                author: myControllerobj
                        .myNewsResponse.articles?[index].publishedAt
                        .toString() ??
                    "",
                date: myControllerobj.myNewsResponse.articles?[index].author ??
                    "",
                image: myControllerobj
                        .myNewsResponse.articles?[index].urlToImage ??
                    "",
              ),
            ),
    );
  }
}

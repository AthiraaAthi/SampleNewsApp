import 'package:flutter/material.dart';
import 'package:news_app_api/controller/search_controller.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController searchTextController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    final searchcontrollerObj = Provider.of<SearchDataController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: searchTextController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      //searchcontroller alrdy exist
                      Provider.of<SearchDataController>(context, listen: false)
                          .SearchData(
                              SearchData:
                                  searchTextController.text.toLowerCase());
                    },
                    icon: Icon(Icons.search)),
                hintText: "Search Your News",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child:
                    // SearchDataController.isLoading
                    //     ? Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     :
                    ListView.builder(
              itemCount:
                  searchcontrollerObj.mySearchNewsResponse.articles?.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(searchcontrollerObj
                          .mySearchNewsResponse.articles?[index].title ??
                      ""),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreenwidget extends StatelessWidget {
  const HomeScreenwidget({
    super.key,
    required this.title,
    required this.des,
    required this.author,
    required this.date,
    required this.image,
  });
  final String title;
  final String des;
  final String author;
  final String date;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 64, 245, 85),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: Text(
                title,
                //'''Lorem Ipsum ''',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                children: [
                  Text(
                    des,
                    //'''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. '''
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        author,
                        //"Robert",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        date,
                        // "26-10-2023",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

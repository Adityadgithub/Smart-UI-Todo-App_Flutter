import 'package:flutter/material.dart';

class thecard extends StatelessWidget {
  final title;
  const thecard({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Card(
        color: Colors.pink,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.format_list_bulleted_sharp,
              size: 50,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 17,
                ),
                Text(
                  "To Do",
                  style: TextStyle(
                    shadows: [
                      Shadow(
                          offset: Offset(0, -5),
                          color: Color.fromARGB(255, 237, 231, 231))
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${title}",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 5),
                    Text(
                      "Home",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

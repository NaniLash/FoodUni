import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      
      home: Scaffold(
        appBar: AppBar(
          title: Text('FoodUni'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child:Image.network("https://images.unsplash.com/photo-1611003228941-98852ba62227?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHw%3D&w=1000&q=80")
            ),
            Container(
              height: 100,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry AA')),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  child:Text("JIA "),
                ),
                // ignore: prefer_const_constructors
                Text("Hola Mundo"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Holaa Maaundo"),
                Text("JIJIJIJA"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
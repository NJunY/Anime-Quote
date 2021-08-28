import 'package:flutter/material.dart';
import 'fetchData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Quote',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: QuoteList(),
    );
  }
}

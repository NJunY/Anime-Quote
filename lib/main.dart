import 'package:flutter/material.dart';
import 'package:anime_quote/pages/show_case.dart';
import 'package:anime_quote/pages/choose_character.dart';
import 'package:anime_quote/pages/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/choose' : (context) => Choose(),
        '/home' : (context) => Show(),
        '/' : (context) => Loading()
      },
    );
  }
}

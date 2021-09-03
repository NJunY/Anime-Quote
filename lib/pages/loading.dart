import 'package:flutter/material.dart';
import 'package:anime_quote/services/fetchData.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupQuote() async {
    animeQuote instance = animeQuote(name: 'Naruto');
    await instance.getQuote();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'name': instance.name,
      'quotes': instance.quote,
      'img' : 'naruto'
    });
  }

  @override
  void initState(){
    super.initState();
    setupQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 250, bottom: 20),
              child: Text(
                  'Anime Quote App',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Text(
              'Powered By: https://animechan.vercel.app/'
            )
          ],
        )
      ),
    );
  }
}

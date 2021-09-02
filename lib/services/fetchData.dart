import 'package:http/http.dart';
import 'dart:convert';

class animeQuote {
  String name;
  String img;
  var quote = [];

  animeQuote({this.name, this.img});

  Future<void> getQuote() async{
    try{
      var response = await get('https://animechan.vercel.app/api/quotes/character?name=$name');
      quote = jsonDecode(response.body);

    }catch(e){
      print(e);
      quote = [];
    }
  }

}
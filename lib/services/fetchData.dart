import 'package:http/http.dart';
import 'dart:convert';

class animeQuote {
  String name;
  Map quote = {};

  animeQuote({this.name});

  Future<void> getQuote(character) async{
    try{
      Response response = await get('https://animechan.vercel.app/api/quotes/character?name=$character');
      quote = jsonDecode(response.body);
      print(quote);

    }catch(e){
      print(e);
      quote = {};
    }
  }

}
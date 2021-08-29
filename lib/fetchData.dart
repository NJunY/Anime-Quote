import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteList extends StatelessWidget {

  final String apiUrl = "https://animechan.vercel.app/api";
  String anime;
  String character;
  int page;

  Future<List<dynamic>> fetchQuotes() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body);
  }

  Future<List<dynamic>> fetchCharacterQuotes() async {
    character = 'saitama';
    anime = null;
    var api = '$apiUrl/quotes/character?name=$character';
    var result = await http.get(api);
    return json.decode(result.body);
  }

  Future<List<dynamic>> fetchAnimeQuotes() async {
    anime = 'Naruto';
    character = null;
    var api = '$apiUrl/quotes/anime?title=$anime';
    var result = await http.get(api);
    return json.decode(result.body);
  }

  Future<List<dynamic>> getPage() async {
    character = 'saitama';
    page = 1;
    if(anime==true){

    }else if(character==true){
      var api = '$apiUrl/quotes/character?name=$character&page=$page';
      var result = await http.get(api);
      return json.decode(result.body);
    }
  }

  String _name(dynamic anime){
    return anime['character'];
  }

  String _quote(dynamic anime){
    return anime['quote'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Quote APP'),
      ),
      body: Container(
        child: FutureBuilder<List <dynamic>>(
          future: getPage(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              print(snapshot);
              return ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          title: Text(
                              _name(snapshot.data[index]),
                            style: TextStyle(
                                fontSize: 20.0
                            ),
                          ),
                          subtitle: Text(_quote(snapshot.data[index])),
                        )
                      ],
                    ),
                  );
                },
              );
            }else{
              print("dsdsf");
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

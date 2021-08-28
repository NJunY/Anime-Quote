import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteList extends StatelessWidget {

  final String apiUrl = "https://animechan.vercel.app/api/quotes/anime?title=naruto";

  Future<List<dynamic>> fetchQuotes() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body);
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
          future: fetchQuotes(),
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

import 'package:flutter/material.dart';
import 'package:anime_quote/services/fetchData.dart';

class Choose extends StatefulWidget {

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {

  List<animeQuote> character = [
    animeQuote(name: 'Saitama'),
    animeQuote(name: 'Naruto'),
    animeQuote(name: 'Kakashi'),
    animeQuote(name: 'Ranma'),
    animeQuote(name: 'Goku'),
    animeQuote(name: 'Itachi Uchiha'),
    animeQuote(name: 'luffy'),
    animeQuote(name: 'vegeta'),
    animeQuote(name: 'madara uchiha'),
    animeQuote(name: 'jotaro'),
    animeQuote(name: 'gaara'),
    animeQuote(name: 'Sasuke')
  ];

  void updateDetail(index) async {
    // print(character[index].name);
    animeQuote instance = character[index];

    await instance.getQuote();
    Navigator.pop(context, {
      'name' : instance.name,
      'quote' : instance.quote
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Choose a Character'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: character.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: ListTile(
                onTap: () {
                  updateDetail(index);
                },
                title: Text(character[index].name),
              ),
            );
          }
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:anime_quote/services/fetchData.dart';

class Choose extends StatefulWidget {

  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {

  List<animeQuote> character = [
    animeQuote(name: 'Saitama', img: 'saitama'),
    animeQuote(name: 'Naruto', img: 'naruto'),
    animeQuote(name: 'Kakashi', img: 'kakshi'),
    animeQuote(name: 'Ranma', img: 'ranma'),
    animeQuote(name: 'Goku', img: 'goku'),
    animeQuote(name: 'Itachi Uchiha', img: 'itachi'),
    animeQuote(name: 'luffy', img: 'luffy'),
    animeQuote(name: 'vegeta', img: 'vegeta'),
    animeQuote(name: 'madara uchiha', img: 'madara'),
    animeQuote(name: 'jotaro', img: 'jotaro'),
    animeQuote(name: 'gaara', img: 'gaara'),
    animeQuote(name: 'Sasuke', img: 'sasuke')
  ];

  void updateDetail(index) async {
    animeQuote instance = character[index];

    await instance.getQuote();
    Navigator.pop(context, {
      'name' : instance.name,
      'quote' : instance.quote,
      'img' : instance.img
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

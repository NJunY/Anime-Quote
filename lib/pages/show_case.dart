import 'package:flutter/material.dart';

class Show extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Show> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
            data['name'],
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/choose');
                    if(result != null){
                      setState(() {
                        data = {
                          'name' : result['name'],
                          'quotes' : result['quote'],
                          'img' : result['img']
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location
                  ),
                label: Text(
                  'Change Character'
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 0),
                child: Image(
                  image: AssetImage(
                    'assets/img/${data['img']}.png',
                  ),
                  height: 200,
                )
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data["quotes"].length,
                  itemBuilder: (context, index){
                    return Padding(
                        padding: const EdgeInsets.all(15.0),
                      child: Card(
                        child: Text(
                          '"${data['quotes'][index]["quote"]}"',
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      )
    );
  }
}

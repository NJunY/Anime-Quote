import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Show extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Show> {

  Map data = {};
  // Color bgColor = const Color(0xffb74093);

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
            data['name'],
          style: TextStyle(
            color: Colors.white
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
                    Icons.switch_account
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
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular((20)), topRight: Radius.circular(20))
                ),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data["quotes"].length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '"${data['quotes'][index]["quote"]}"',
                              style: TextStyle(
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

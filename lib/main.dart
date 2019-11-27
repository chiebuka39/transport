import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transport Rent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  List<String> actions = ['all', 'Segaway', 'Scooter', 'NineBot', 'The Scooter'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 80,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Transport Rent',
              style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 50,
            child: ListView.builder(itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: Center(child: Text(actions[index], style: TextStyle(color: Colors.white),)),
                  decoration: BoxDecoration(
                      border: _index == index ? Border.all( color: Colors.white) : Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
              );
            }, itemCount: 5,scrollDirection: Axis.horizontal,),
          ),

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

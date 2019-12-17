import 'package:flutter/cupertino.dart';
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
  PageController controller;

  List<String> actions = ['all', 'Segaway', 'Scooter', 'NineBot', 'The Scooter'];

  @override
  void initState() {
    controller = PageController(viewportFraction: 0.75);
    super.initState();
  }

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
          SizedBox(height: 40,),
          Container(
            height: 50,
            child: ListView.builder(itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(

                  padding: EdgeInsets.symmetric(horizontal: 30),
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
          SizedBox(height: 30,),
          Expanded(child: LayoutBuilder(

            builder: (context, constraints){
              return PageView(
                controller: controller,
                children: <Widget>[
                buildMainContainer(0),
                buildMainContainer(1),
                buildMainContainer(2),

              ],);
            },

          )),
          SizedBox(height: 50,)
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildMainContainer(int index) {
    return AnimatedBuilder(
      child: Container(
                  margin: EdgeInsets.only(right: 0),
                  height: 150,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ), animation: controller,
      builder: (BuildContext context, Widget child) {
        double value = 1;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
          return Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 0.0, right: 20.0, bottom: 10.0),
                height: Curves.easeIn.transform(value) * 500,
                child: child,
              ));
        } else {
          return Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(
                    left: 0.0, right: 20.0, bottom: 10.0),
                height:
                Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                    500,
                child: child,
              ));
        }
      },
    );
  }
}

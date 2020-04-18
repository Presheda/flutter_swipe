import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  Home createState() {
    // TODO: implement createState

    return Home();
  }
}

class Home extends State<MyHomePage> {
  final List<String> items = new List<String>.generate(30, (i) {
    return "Items ${i + 1}";
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Item dismissed"),
              ));
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text("${items[index]}"),
            ),
          );
        },
      ),
    );
  }
}

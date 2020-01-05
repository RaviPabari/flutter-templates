//Here I have made an implemantation of how to use a bottom sheet in flutter app

import 'package:flutter/material.dart';

void main() => runApp(MyApp());
//created a stateless widget
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //whenever the option is selected the respected name will replace the appbar title
        title: Text('$textName'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Body'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _func(),
        child: Icon(Icons.menu),
      ),
    );
  }

  void _func() {
    //showModalBottotmSheet is the widget which will be used to implement everything
    showModalBottomSheet(
      //'shape widget' to give our bottom sheet a rounded edged view
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      ),
      //hardcoding everything here for simple implementation
      //we can also use the list<String> and create a separate class and call it in main
        context: context,
        builder: (context) {
          return Container(
            //creating a column for a list view
            child: Column(
              //miz size so that the sheet will take minimum available space
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //bottom view will be implemented using listTile
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Send Messagge'),
                  //ontap will need a function
                  onTap: () => _selectItem('Send Message'),
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Add Images'),
                  onTap: () => _selectItem('Add Images'),
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Camera'),
                  onTap: () => _selectItem('Camera'),
                ),
              ],
            ),
          );
        });
  }

  void _selectItem(String name) {
    //if navigator.pop not used then it will not bring the sheet down
    Navigator.pop(context);
    setState(() {
      //setting the sate of the app so every time clicked the appbar title will change
      textName = name;
    });
  }
}

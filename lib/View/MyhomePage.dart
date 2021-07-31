import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myworks/View/TodoAddWidget.dart';
import 'package:myworks/View/myworkListwidget.dart';

//! main page

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //! have to bottom tabs
  int currentIndex = 0;

  final tabs = [
    MyworkListWidget(),
    Container(
      child: Text('tab two'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! app bar
      appBar: AppBar(
        title: Text("My Works"),
      ),

      //! body code
      body: tabs[currentIndex],

      //! bottom tab defind here
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Works"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completde")
        ],
      ),

      //! work add button
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //! pop up screen
            showDialog(
                context: context,
                barrierDismissible: false, // for avoid closing
                builder: (context) {
                  return TodoAddWidget();
                });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Icon(Icons.add)),
    );
  }
}

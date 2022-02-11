import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myworks/Controller/firbaseApi.dart';
import 'package:myworks/Controller/workProvider.dart';
import 'package:myworks/Model/workModel.dart';
import 'package:myworks/View/TodoAddWidget.dart';
import 'package:myworks/View/completedWork.dart';
import 'package:myworks/View/myworkListwidget.dart';
import 'package:myworks/gmap/gmapview.dart';
import 'package:provider/provider.dart';

//! main page

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //! have to bottom tabs
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      MyworkListWidget(),
      CompletedWorkListwidget(),
      Gmap(),
    ];
    return Scaffold(
      //! app bar
      appBar: AppBar(
        title: Text("My Works"),
      ),

      //! body code
      body: StreamBuilder<List<WorkModel>>(
        stream: FirebaseApi.readCollection(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText("$snapshot");
              } else {
                final todos = snapshot.data;
                final provider =
                    Provider.of<WorkProvider>(context, listen: false);

                provider.setTodos(todos!);

                return tabs[currentIndex];
              }
          }
        },
      ),

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
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Completde"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city), label: "Gmap")
        ],
      ),

      //! work add button
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
              onPressed: () {
                //! pop up screen
                showDialog(
                    context: context,
                    barrierDismissible: false, // for avoid closing
                    builder: (context) {
                      return TodoAddWidget();
                    });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.add)),
        ],
      ),
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );


// {
 
//   "work": [
//     {
//       "id": "very-soft",
//       "isDone": "true",
//       "title": "very-soft",
//       "createdTime": "very-soft",
//       "description": "https://pokeapi.co/api/v2/berry-firmness/1/"
//     },
//      {
//       "id": "very-soft",
//       "isDone": "true",
//       "title": "very-soft",
//       "createdTime": "very-soft",
//       "description": "https://pokeapi.co/api/v2/berry-firmness/1/"
//     }
    
//   ]
// }
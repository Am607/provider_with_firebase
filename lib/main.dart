import 'package:flutter/material.dart';
import 'package:myworks/Controller/workProvider.dart';
import 'package:myworks/View/MyhomePage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

//! provider as statemangement
Future main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => WorkProvider(),
        child: MaterialApp(
          theme: ThemeData(
            // primaryIconTheme: IconThemeData(color: Colors.red),
            primarySwatch: Colors.orange,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: MyHomePage(),
          ),
        ),
      );
}

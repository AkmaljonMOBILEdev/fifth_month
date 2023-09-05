import 'package:fifth_month/data/models/universal_data.dart';
import 'package:fifth_month/data/network/api_service.dart';
import 'package:fifth_month/ui/math/math_screen.dart';
import 'package:fifth_month/ui/vocabulary/vocabulary_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homework"),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: ()async{
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VocabularyScreen()));
            },
            title: Text("Vocabulary"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MathScreen()));
            },
            title: Text("Math"),
          )
        ],
      ),
    );
  }
}

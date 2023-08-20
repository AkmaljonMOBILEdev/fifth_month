import 'package:fifth_month/ui/home_work/bad.dart';
import 'package:fifth_month/ui/home_work/flag.dart';
import 'package:fifth_month/ui/home_work/good.dart';
import 'package:fifth_month/ui/home_work/normal.dart';
import 'package:fifth_month/ui/home_work/smiling.dart';
import 'package:fifth_month/ui/home_work/snowman.dart';
import 'package:flutter/material.dart';

import '../home_work/very_bad.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Paint"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FlagScreen()));
            },
            title: Text("Flag"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SnowmanScreen()));
            },
            title: Text("Snowman"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Smiling()));
            },
            title: Text("Smiling"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GoodScreen()));
            },
            title: Text("Good"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NormalScreen()));
            },
            title: Text("Normal"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BadScreen()));
            },
            title: Text("Bad"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VeryBadScreen()));
            },
            title: Text("Very Bad"),
          ),
        ],
      ),
    );
  }
}

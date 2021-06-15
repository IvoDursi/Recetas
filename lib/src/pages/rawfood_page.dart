import 'package:flutter/material.dart';


class RawFoodPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Hero(
          tag: "Raw Food",
          child: Text("Raw Food", style: TextStyle(color: Colors.tealAccent[700], fontWeight: FontWeight.bold))
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent[400],
        child: Icon(Icons.add_rounded, size: 31),
        elevation: 0,
        onPressed: (){
          Navigator.pushNamed(context, "addrecipe");
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:receta/src/widgets/categoriesrecipes.dart';
import 'package:receta/src/widgets/totalrecipes_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.tealAccent[700], size: 28),
            onPressed: (){
              
            },
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello,", style: TextStyle(color: Colors.tealAccent[700],fontSize: 24)),
            Text("What you want to cook today?", style: TextStyle(color: Colors.grey),)
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Totalrecipes(),
            CategoriesText(texto: "Categories", size: 26),
            SizedBox(height: 350,child: CategoriesRecipes()),
            CategoriesText(texto: "Latest recipes", size: 18),
            SizedBox(height: 275,child: LatestRecipes())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent[400],
        child: Icon(Icons.add_rounded, size: 31),
        onPressed: (){
          Navigator.pushNamed(context, "addrecipe");
        },
        elevation: 0,
      ),
    );
  }
}
      

class LatestRecipes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Last(),
        _Last(),
        _Last()
      ],
    );
  }
}

class _Last extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:12, vertical: 5),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(10)
      ),
    );
  }
}

class CategoriesText extends StatelessWidget {

  final String texto;
  final double size;
  final Color color;

  CategoriesText({
    this.texto,
    this.size,
    this.color = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:20),
      child: Text(this.texto, style: TextStyle(fontSize: this.size, fontWeight: FontWeight.bold, color: this.color))
    );
  }
}




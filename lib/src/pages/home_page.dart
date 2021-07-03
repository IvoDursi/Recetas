import 'package:flutter/material.dart';
import 'package:receta/src/modelo/receta_model.dart';
import 'package:receta/src/modelo/receta_provider.dart';
import 'package:receta/src/widgets/categoriesrecipes.dart';
import 'package:receta/src/widgets/totalrecipes_widget.dart';

class HomePage extends StatelessWidget {

  RecetasProvider recetasProvider = RecetasProvider();

  int total;

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
      body: Stack(
        children:[
          Cuerpo(),
          SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Totalrecipes(),
              CategoriesText(texto: "Categories", size: 32),
              SizedBox(height: 350,child: CategoriesRecipes()),
              CategoriesText(texto: "Latest recipes", size: 32),
              SizedBox(height: 275,child: lastRecipes())
            ],
          ),
        ),
        ]
      ),
    );
  }
      
  Widget lastRecipes(){
    return FutureBuilder(
      future: recetasProvider.cargarReceta(),
      builder: (BuildContext context, AsyncSnapshot<List<Receta>> snapshot){
      if (snapshot.hasData) {

        final recet = snapshot.data;
        final ultimas = recet.reversed.toList();

        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, i ) => _last(context,  ultimas[i])
        );
      } else {

        return Center(child: CircularProgressIndicator());
      }

    }
  );
}

  Widget _last(BuildContext context, Receta recet){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "detallereceta", arguments: recet);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:12, vertical: 5),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.greenAccent[100],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(margin: EdgeInsets.only(left:20),child: Text(recet.nombrereceta, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            Container(margin:EdgeInsets.all(15),child: Image(image: AssetImage("assets/plate.png")))
          ],
        ),
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
    this.color = Colors.black87
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:20),
      child: Text(this.texto, style: TextStyle(fontSize: this.size, fontWeight: FontWeight.bold, color: this.color, fontFamily: "marker")),
    );
  }
}

class Cuerpo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(left: size.height * 0.1,top: size.width * 0.6, child: circulo),
        Positioned(left: size.height * -0.3,top: size.width * -0.8, child: circulo),
      ],
    );
  }

  final circulo = Container(
    width: 600.0,
    height: 600.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(300.0),
      color: Colors.lime[100]
    ),
  );
}




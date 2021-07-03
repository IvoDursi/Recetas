import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta/src/modelo/receta_model.dart';
import 'package:receta/src/modelo/receta_provider.dart';
import 'package:receta/src/provider/infotodas.dart';

class Totalrecipes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Bounce(
      delay: Duration(seconds: 2),
      duration: Duration(seconds: 2),
      from: 5,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:40, vertical: 20),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.greenAccent[100],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Container(margin: EdgeInsets.all(12),child: Image(image: AssetImage("assets/book.png"))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _totalR(),
                SizedBox(height:5),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "allrecipes"),
                  child: Text("See all recipes", style: TextStyle(fontSize: 16))
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _totalR extends StatelessWidget {

  final recetasProvider = RecetasProvider();

  @override
  Widget build(BuildContext context) {

  final todasInfo = Provider.of<TodasInfo>(context);

    return FutureBuilder(
      future: recetasProvider.cargarReceta(),
      builder: (BuildContext context, AsyncSnapshot<List<Receta>> snapshot){
        if(snapshot. hasData){
          final rec = snapshot.data;
          todasInfo.todas = rec.length.toString();
          return Container(margin:EdgeInsets.symmetric(horizontal: 12),child: Text("You have " + todasInfo.todas +  " recipes!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),));
        } else {
          return Container(margin:EdgeInsets.symmetric(horizontal: 12),child: Text("You have 0 recipes!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),));
        }
      },
    );
  }
}
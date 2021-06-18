import 'package:flutter/material.dart';
import 'package:receta/src/modelo/receta_model.dart';


class DetalleRecPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Receta receta = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: _body(context, receta)
    );
  }

  Widget _body(BuildContext context, Receta receta){
    return Stack(
      children: [
        Positioned(left: -20, top: 200,child: circulo),
        Positioned(left: -100, top: -100,child: _encabezado(context, receta)),
        SafeArea(
          child: Container(
            margin: EdgeInsets.all(15),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20)
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(receta.nombrereceta, style: TextStyle(fontSize: 70, color: Colors.white, fontFamily: "marker")),
                  SizedBox(height: 10),
                  Text("ingredients", style: TextStyle(fontSize: 38, color: Colors.greenAccent[700], fontFamily: "marker")),
                  SizedBox(height: 5),
                  Container(margin: EdgeInsets.symmetric(horizontal: 20), child: Text(receta.ingredientes, style: TextStyle(fontSize: 25, color: Colors.white, fontStyle: FontStyle.italic),)),
                  SizedBox(height: 10),
                  Text("indications", style: TextStyle(fontSize: 30, color: Colors.greenAccent[700], fontFamily: "marker")),
                  SizedBox(height: 5),
                  Container(margin: EdgeInsets.symmetric(horizontal: 25), child: Text(receta.indicaciones, style: TextStyle(fontSize: 25, color: Colors.white, fontStyle: FontStyle.italic),)),
                  SizedBox(height: 10),
                  Text("category", style: TextStyle(fontSize: 30, color: Colors.greenAccent[700], fontFamily: "marker")),
                  SizedBox(height: 5),
                  Text("Raw Food", style: TextStyle(fontSize: 50, color: Colors.white, fontFamily: "marker")),
                  SizedBox(height: 5),
                ],
              ),
            )
          ),
        )

      ],
    );
  }


  
  Widget _encabezado(BuildContext context, Receta receta){

    return (receta.fotoUrl == null)
      ? Image(image: AssetImage('assets/noimg.png'))
      : Container(
        width: 450,
        height: 450,
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(250),
          child: Image(
            image: NetworkImage( receta.fotoUrl ),
            fit: BoxFit.cover,
          ),
        ),
    );
  }

  final circulo = Container(
    width: 700.0,
    height: 700.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(350.0),
      color: Colors.lime[100]
    ),
  );
}
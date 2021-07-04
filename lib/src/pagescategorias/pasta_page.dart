import 'package:flutter/material.dart';
import 'package:receta/src/modelo/receta_model.dart';
import 'package:receta/src/modelo/receta_provider.dart';


class PastaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Pasta & Sauces", style: TextStyle(color: Colors.tealAccent[700], fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent[400],
        child: Icon(Icons.add_rounded, size: 31),
        elevation: 0,
        onPressed: (){
          Navigator.pushNamed(context, "agregarcategoria");
        },
      ),
      body: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(left: size.height * -0.3,top: size.width * 0.6, child: circulo),
        Positioned(left: size.height * 0.1,top: size.width * -0.8, child: circulo),
        Listado()
      ],
    );
  }

  final circulo = Container(
    width: 600.0,
    height: 600.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(300.0),
      color: Colors.teal[100]
    ),
  );
}

class Listado extends StatelessWidget {

  RecetasProvider recetasProvider = RecetasProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recetasProvider.cargarReceta(),
      builder: (BuildContext context, AsyncSnapshot<List<Receta>> snapshot){
      if (snapshot.hasData) {

        final recet = snapshot.data;
        Iterable<Receta> receta = recet.where((re) => re.categoria == "Pasta & Sauces").toList().reversed;
        List ultimas = receta.toSet().toList();


        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: ultimas.length,
          itemBuilder: (context, i ) => _lista(context,  ultimas[i])
        );
      } else {
        return Center(child: CircularProgressIndicator()); 
      }
      }
    );
  }

  Widget _lista(BuildContext context, Receta recet){

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, "detallereceta", arguments: recet);
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        height: size.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.lime[100],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imagen(context, recet),
            Container(margin: EdgeInsets.only(left:15, top:4),child: Text(recet.nombrereceta, style: TextStyle(fontSize: 20),))
          ],
        )
      ),
    );
  }

  Widget _imagen(BuildContext context, Receta recet){
    return Container(
      width: 500,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.black26
      ),
      child: (recet.fotoUrl == null)
        ? Image(image: AssetImage('assets/noimg.png'))
        : Container(
          child: ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image(
              image: NetworkImage( recet.fotoUrl ),
              fit: BoxFit.cover,
            ),
          ),
        ),
    );
  }
}
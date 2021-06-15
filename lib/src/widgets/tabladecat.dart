import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta/src/modelo/categoria_provider.dart';

class Tabladecat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Table(
        children: [
          TableRow(
            children:[
              _Cuadraditos(texto: "Raw Food",),
              _Cuadraditos(texto: "Bakery",),
              _Cuadraditos(texto: "  Classics \n Veganized",)
            ]
          ),
          TableRow(
            children:[
              _Cuadraditos(texto: "   Pasta \n& Sauces",),
              _Cuadraditos(texto: "Dressing",),
              _Cuadraditos(texto: "Snacks",)
            ]
          ),
        ],
      ),
    );
  }
}

class _Cuadraditos extends StatelessWidget {

  String texto;

  _Cuadraditos({
    this.texto
  });

  @override
  Widget build(BuildContext context) {

    final List cate = [];

    final categoria = Provider.of<CategoriaRec>(context);

    return GestureDetector(
      onTap: (){
        if(categoria.talla == ""){

          categoria.talla = this.texto;
          print(categoria.talla);

        } else if(categoria.talla.contains(this.texto)){

          categoria.talla += " " + this.texto;
          print(categoria.talla + "2");

        } else {

          categoria.talla = this.texto;
          print(categoria.talla + "3");

        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 50,
        decoration: BoxDecoration(
          color: (categoria.talla.contains(this.texto))? Colors.green : Colors.grey[400],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: (categoria.talla.contains(this.texto))? Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 16)) : Text(this.texto),
        ),
      ),
    );
  }
}

class _Cuadraditos2 extends StatelessWidget {

  final String texto;

  _Cuadraditos2({
    this.texto
  });

  @override
  Widget build(BuildContext context) {

    final List cate = [];

    bool seleccionado = false;

    final categoria = Provider.of<CategoriaRec>(context);

    return GestureDetector(
      onTap: (){
        if(seleccionado == false){

          cate.add(this.texto);
          categoria.talla += cate.toString();
          print(categoria.talla);
          seleccionado = true;

        } else {

          seleccionado = false;

        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 50,
        decoration: BoxDecoration(
          color: (seleccionado == true)? Colors.green : Colors.grey[400],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: (seleccionado == true)? Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 16)) : Text(this.texto),
        ),
      ),
    );
  }
}
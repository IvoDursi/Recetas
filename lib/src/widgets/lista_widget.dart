import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta/src/modelo/categoria_provider.dart';

class Lista extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Elementos(color: Colors.red, texto: "A"),
        Elementos(color: Colors.blue, texto: "B"),
        Elementos(color: Colors.purpleAccent, texto: "C"),
        Elementos(color: Colors.yellow, texto: "D"),
        Elementos(color: Colors.green, texto: "E"),
        Elementos(color: Colors.grey, texto: "F"),
      ],
    );
  }
}

class Elementos extends StatelessWidget {
  final Color color;
  final String texto;

  Elementos({
    this.color,
    this.texto
  });

  @override
  Widget build(BuildContext context) {

    final categoria = Provider.of<CategoriaRec>(context);

    return GestureDetector(
      onTap: (){
        if(categoria.talla != this.texto){
          final categoria = Provider.of<CategoriaRec>(context, listen: false);
          categoria.talla = this.texto;
        } else {
          categoria.talla = "";
        }
      },
      child: Container(
        margin: EdgeInsets.only(left:10,right:10,top:10),
        height: (this.texto == categoria.talla) ? 170 : 160,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
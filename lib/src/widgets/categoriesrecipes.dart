import 'package:flutter/material.dart';

class CategoriesRecipes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      children: [
        _ImagesCat(imagen: "assets/rawfood.png", categoria: "Raw Food"),
        _ImagesCat(imagen: "assets/cakevegan.png", categoria: "Bakery"),
        _ImagesCat(imagen: "assets/burger.png", categoria: "Classic Veganized"),
        _ImagesCat(imagen: "assets/pastas.png", categoria: "Pasta & Sauces"),
        _ImagesCat(imagen: "assets/hummus.png", categoria: "Dressing"),
        _ImagesCat(imagen: "assets/snack.png", categoria: "Snacks"),
      ],
    );
  }
}

class _ImagesCat extends StatelessWidget {

  final String imagen;
  final String categoria;

  _ImagesCat({
    this.imagen,
    this.categoria
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, "rawfood");
        },
        child: Hero(
          tag: this.categoria,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(this.imagen),
                  fit: BoxFit.fitWidth,
                  width: 230,
                ),
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                  width: 190,
                  height: 50,
                  decoration: BoxDecoration(
                   color: Colors.black54,
                   borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      Positioned(left:12.5,top:13,child: Text(this.categoria, style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
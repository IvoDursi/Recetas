import 'package:flutter/material.dart';
import 'package:receta/src/pages/home_page.dart';
import 'package:receta/src/widgets/tabladecat.dart';


class AddRecipePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Add your new recipe!", style: TextStyle(color: Colors.tealAccent[700], fontWeight: FontWeight.bold),),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.camera_enhance_rounded, color: Colors.tealAccent[700], size: 28),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.image, color: Colors.tealAccent[700], size: 28),
            onPressed: (){},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Cuerpo()
      )
    );
  }
}

class Cuerpo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FotoRec(),
        CategoriesText(
          texto: "Delicacy name",
          size: 20,
          color: Colors.black54,
        ),
        AddName(),
        CategoriesText(
          texto: "Ingredients",
          size: 20,
          color: Colors.black54,
        ),
        SizedBox(height:10),
        Ingredientes(),
        SizedBox(height:10),
        Tabladecat(),
        BotonAdd(),
        SizedBox(height:10),
      ],
    );
  }
}

class FotoRec extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          image: AssetImage("assets/noimg.png"),
          placeholder: AssetImage("assets/noimg.png"),
          height: 240,
          width: 400,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class AddName extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20, vertical: 10),
      child: TextFormField(
        cursorColor: Colors.white,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 20,),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          icon: Icon(Icons.book,color: Colors.green, size: 28)
        ),
        onChanged: (value){
        },
      ),
    );
  }
}

class Ingredientes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20),
      child: TextFormField(
        cursorColor: Colors.white,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 18),
        decoration: InputDecoration(
          errorMaxLines: 10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          labelStyle: TextStyle(color: Colors.white), 
        ),
        maxLines: 16,
        onChanged: (value){
        },
      ),
    );
  }
}

class BotonAdd extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:20, vertical: 10),
        width: 400,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text("Add", style: TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  
}

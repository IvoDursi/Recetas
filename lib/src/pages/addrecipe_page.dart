import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:receta/src/modelo/categoria_provider.dart';
import 'package:receta/src/modelo/receta_model.dart';
import 'package:receta/src/modelo/receta_provider.dart';
import 'package:receta/src/pages/home_page.dart';

class AddRecipePage extends StatefulWidget {

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {

  Receta receta = Receta();
  RecetasProvider recetasProvider = RecetasProvider();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final picker = ImagePicker();
  File foto;
  String texto;
  bool _guardando = false;

  String resultado;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Add your new recipe!", style: TextStyle(color: Colors.tealAccent[700], fontWeight: FontWeight.bold),),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.image, color: Colors.tealAccent[700], size: 28),
            onPressed: _seleccionarFoto
          ),
          IconButton(
            icon: Icon(Icons.camera_enhance_rounded, color: Colors.tealAccent[700], size: 28),
            onPressed: _tomarFoto,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: _cuerpo(),
        )
      )
    );
  }

  Widget _cuerpo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fotorec(),
        CategoriesText(
          texto: "Delicacy name",
          size: 24,
          color: Colors.black54,
        ),
        _addName(),
        CategoriesText(
          texto: "Ingredients",
          size: 24,
          color: Colors.black54,
        ),
        SizedBox(height:10),
        _ingredientes(),
        SizedBox(height:10),
        CategoriesText(
          texto: "Indications",
          size: 24,
          color: Colors.black54,
        ),
        SizedBox(height:10),
        _indicaciones(),
        _botonAdd(),
        SizedBox(height:10),
      ],
    );
  }

  Widget _fotorec(){

    if(receta.fotoUrl != null){
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage(
          image: NetworkImage(receta.fotoUrl),
          placeholder: AssetImage("assets/noimg.png"),
          height: 240,
          width: 400,
          fit: BoxFit.fitWidth,
        ),
      ),
    );

    } else {
        if( foto != null ){
          return Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                foto,
                fit: BoxFit.cover,
               height: 240.0,
              ),
            ),
          );
        }
    setState(() {});
      return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            image: NetworkImage("assets/noimg.png"),
            placeholder: AssetImage("assets/noimg.png"),
            height: 240,
            width: 400,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }
  }

  Widget _addName(){
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
        onSaved: (value) => receta.nombrereceta = value,
        validator: (value){
          if(value.length < 3){
            return "Put Aditional Information";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _ingredientes(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20),
      child: TextFormField(
        cursorColor: Colors.greenAccent,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 18),
          decoration: InputDecoration(
          errorMaxLines: 10,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          labelStyle: TextStyle(color: Colors.white), 
        ),
        maxLines: 10,
        onSaved: (value) => receta.ingredientes = value,
        validator: (value){
          if(value.length < 3){
            return "Put Aditional Information";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget _indicaciones(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20),
      child: TextFormField(
        cursorColor: Colors.greenAccent,
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
        onSaved: (value) => receta.indicaciones = value,
        validator: (value){
          if(value.length < 3){
            return "Put Aditional Information";
          } else {
            return null;
          }
        },
      ),
    );
  }
  

  Widget _tabladecat(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Table(
        children: [
          TableRow(
            children:[
              _cuadraditos("Raw Food",),
              _cuadraditos("Bakery",),
              _cuadraditos("  Classics \n Veganized",)
            ]
          ),
          TableRow(
            children:[
              _cuadraditos("   Pasta \n& Sauces",),
              _cuadraditos("Dressing",),
              _cuadraditos("Snacks",)
            ]
          ),
        ],
      ),
    );
  }

  Widget _cuadraditos(texto){

    final categoria = Provider.of<CategoriaRec>(context);

    return GestureDetector(
      onTap: (){
        if(categoria.talla == ""){

          categoria.talla = texto;
          print(categoria.talla);

        } else if(categoria.talla.contains(texto)){

          categoria.talla = "";
          print(categoria.talla + "2");

        } else {

          categoria.talla += texto;
          print(categoria.talla + "3");

        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 50,
        decoration: BoxDecoration(
          color: (categoria.talla.contains(texto))? Colors.green : Colors.grey[400],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: (categoria.talla.contains(texto))? Text(texto, style: TextStyle(color: Colors.white, fontSize: 16)) : Text(texto),
        ),
      ),
    );
  }

  Widget _botonAdd(){
  return GestureDetector(
    onTap: (_guardando) ? null : _submit,
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

  void _submit()async{//El boton para crear o editar productos
    
    if(!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {_guardando = true;});

    if(foto != null){
      receta.fotoUrl = await recetasProvider.subirImagenReceta(foto);
    }

    if(receta.id == null){
      recetasProvider.crearReceta(receta);
    } else {
      recetasProvider.editarReceta(receta);
    } 
    Navigator.pushReplacementNamed(context, "home");
  }

  _seleccionarFoto() async {
    _procesarImagen( ImageSource.gallery );
  }

  _tomarFoto() async {
    _procesarImagen( ImageSource.camera );
  }

  _procesarImagen(ImageSource seleccion)async{
    final pickedFile = await picker.getImage(source: seleccion); 
    if (pickedFile != null){
      receta.fotoUrl = null;
    }
    setState((){foto = File(pickedFile.path);});
  }
}


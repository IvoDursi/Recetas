import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta/src/modelo/categoria_provider.dart';
import 'package:receta/src/pages/addrecipe_page.dart';
import 'package:receta/src/pages/all_page.dart';
import 'package:receta/src/pages/detallerec_page.dart';
import 'package:receta/src/pages/home_page.dart';
import 'package:receta/src/pagescategorias/bakery_page.dart';
import 'package:receta/src/pagescategorias/classic_page.dart';
import 'package:receta/src/pagescategorias/dressing_page.dart';
import 'package:receta/src/pagescategorias/pasta_page.dart';
import 'package:receta/src/pagescategorias/rawfood_page.dart';
import 'package:receta/src/pagescategorias/snacks_page.dart';
import 'package:receta/src/widgets/lista_widget.dart';
 
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CategoriaRec>(create: (_) => CategoriaRec(),)
    ],
    child: MyApp(),
  ));
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recetas App',
      initialRoute: "home",
      routes: {
        "home": (BuildContext context) => HomePage(),
        "Raw Food": (BuildContext context) => RawFoodPage(),
        "Bakery": (BuildContext context) => BakeryPage(),
        "Classic Veganized": (BuildContext context) => ClassicPage(),
        "Pasta & Sauces": (BuildContext context) => PastaPage(),
        "Dressing": (BuildContext context) => DressingPage(),
        "Snacks": (BuildContext context) => SnacksPage(),
        "agregarcategoria": (BuildContext context) => AddRecipePage(),
        "elegircategoria": (BuildContext context) => Lista(),
        "detallereceta": (BuildContext context) => DetalleRecPage(),
        "allrecipes": (BuildContext context) => AllRecipesPage()
      },
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
    );
  }
}
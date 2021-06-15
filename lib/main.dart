import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta/src/modelo/categoria_provider.dart';
import 'package:receta/src/pages/addrecipe_page.dart';
import 'package:receta/src/pages/home_page.dart';
import 'package:receta/src/pages/rawfood_page.dart';
 
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
        "rawfood": (BuildContext context) => RawFoodPage(),
        "addrecipe": (BuildContext context) => AddRecipePage()
      },
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CategoriaRec with ChangeNotifier{
  String _categoria = "";

  String get talla => this._categoria;
  set talla(String valor){
    this._categoria = valor;
    notifyListeners();
  }
}
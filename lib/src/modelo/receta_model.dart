import 'dart:convert';

Receta recetaFromJson(String str) => Receta.fromJson(json.decode(str));

String recetaToJson(Receta data) => json.encode(data.toJson());

class Receta {
  String fotoUrl;
  String nombrereceta;
  String ingredientes;
  String indicaciones;
  String categoria;
  String id;

  Receta({
    this.fotoUrl,
    this.nombrereceta,
    this.ingredientes,
    this.indicaciones,
    this.categoria,
    this.id,
  });

  factory Receta.fromJson(Map<String, dynamic> json) => Receta(
    fotoUrl: json["fotoUrl"],
    nombrereceta: json["nombrereceta"],
    ingredientes: json["ingredientes"],
    indicaciones: json["indicaciones"],
    categoria: json["categoria"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "fotoUrl": fotoUrl,
    "nombrereceta": nombrereceta,
    "ingredientes": ingredientes,
    "indicaciones": indicaciones,
    "categoria": categoria,
    "id": id,
  };
}

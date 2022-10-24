/*
* andres gonzalez
* SENA
* Ficha:2470980
*
* */

//importamos el paquete flutter para utilizar el framework
import 'package:flutter/material.dart';
import 'package:navigator2_v3/presentation/home_page.dart';
//corremos la aplicacion
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      //quitamos banner que viene por defecto
      debugShowCheckedModeBanner: false,
      //lo enviamos a la hoja de productos
      home: HomePage(),
      //colocamos nombre a la aplicacion
      title: ("Tienda de Productos"),
    );
  }
}
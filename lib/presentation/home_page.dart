import 'package:flutter/material.dart';
import 'package:navigator2_v3/presentation/shooping_cart.dart';

import 'lista_productos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListaProductos> _lista = <ListaProductos>[];

  final List<ListaProductos> _listacarrito = <ListaProductos>[];

  @override
  void initState() {

    super.initState();
    _productos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
        actions: [
          Row(
            children: [
              IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    if (_listacarrito.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Carrito(_listacarrito),
                        ),
                      );
                    }
                  }),
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _lista.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: Image(
                        image: NetworkImage(
                          _lista[index].imageURL.toString(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                _lista[index].nombre.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Text(_lista[index].precio.toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (_lista[index].isAdd!) {
                              _listacarrito.removeWhere(
                                  (element) => element.id == index);
                              _lista[index].isAdd = false;
                            } else {
                              _listacarrito.add(_lista[index]);
                              _lista[index].isAdd = true;
                            }
                          });
                        },
                        icon: (!_lista[index].isAdd!)
                            ? Icon(Icons.shopping_cart)
                            : Icon(
                                Icons.shopping_cart,
                                color: Colors.red,
                              ))
                  ],
                ),
              ),
            );
          }),
    );
  }

  void _productos() {
    var list = <ListaProductos>[
      ListaProductos(nombre: 'Pizza familiar 3 carnes', precio: 40000, imageURL: 'img/pizza.png', id: 1, isAdd: false),
      ListaProductos(nombre: 'Hamburguesa', precio: 16500, imageURL: 'img/hamburguesa.jpg', id: 2, isAdd: false),
      ListaProductos(nombre: 'Salchipapas', precio: 11750, imageURL: 'img/salchipapa.jpg', id: 3, isAdd: false),
      ListaProductos(nombre: 'Perro Caliente', precio: 8900, imageURL: 'img/perrito.jpg', id: 4, isAdd: false),
      ListaProductos(nombre: 'Lasaña', precio: 17000, imageURL: 'img/lasaña.jpg', id: 5, isAdd: false)
    ];
    setState(() {
      _lista = list;
    });
  }
}

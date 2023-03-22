import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FoodUni'),
      ),
      body: Column(
        //spaceBetween
        //spaceAround
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: Colors.red,
            width: MediaQuery.of(context).size.width,
            child: Text('Hola 01', textAlign: TextAlign.center,),
          ),
          Container(
            color: Colors.red,
            child: Text('Hola 02'),
          ),
          Container(
            //Le asignamos la mitad de la pantalla
            color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text('Hola 03', textAlign: TextAlign.center,),
          )
        ]
      ),
    );
  }
}
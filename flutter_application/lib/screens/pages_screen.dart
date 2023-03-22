import 'package:flutter/material.dart';
//Servicios
import 'package:flutter_application/services/firebase_service.dart';

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
          title: const Text('FoodUni'),
          backgroundColor: Colors.red,
        ),
        body: FutureBuilder(
            future: getUser(),
            //El snapshot es resultado de lo que nos devuelve getUser()
            builder: (context, snapshot) {
              //Regresa algo solamente si data tiene y es para que no nos de un errorororororrorororo
              if (snapshot.hasData) {
                return ListView.builder(
                    //Signo ? porque puede que no tenga nada, si no viene nada no muestra nada
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Text(
                        //Trae la propiedad del campo
                        //Index va en base a el lenght, de uno en uno
                        snapshot.data?[index]['nombre'],
                      );
                    });
              } else {
                //Circulo de espera por si no encuentra nada
                return const Center(child: CircularProgressIndicator());
              }
            }
      )
    );
  }
}
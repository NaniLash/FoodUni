import 'package:flutter/material.dart';
//Servicios
import 'package:flutter_application/services/firebase_service.dart';
//Screens
import 'package:flutter_application/screens/product_screen.dart';
import 'package:flutter_application/screens/orders_screen.dart';
import 'package:flutter_application/screens/account_screen.dart';

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
        title: const Text('Inicio'),
        backgroundColor: Colors.red,
      ),
      body: futureBuilder(),
      floatingActionButton: floatingActionButton(context),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
}


Widget logo() {
  return const Image(
    image: AssetImage('asset/log.png'),
    height: 100.0,
    width: 100.0,
  );
}

Widget futureBuilder() {
  return FutureBuilder(
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
  );
}

Widget floatingActionButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Product()));

    },
    backgroundColor: Colors.red,
    child: const Icon(Icons.add),
  );
}

Widget bottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: 'Account',
      ),
    ],
    backgroundColor: Colors.red,
    selectedItemColor: Colors.white,
    onTap: (int index) {
      switch(index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context ) => Inicio()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Orders()),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Account()),
          );
          break;
      }
    },
  );
}

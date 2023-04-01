import 'package:flutter/material.dart';
//Servicios
import 'package:flutter_application/services/firebase_service.dart';
//Screens
import 'package:flutter_application/src/repository/screens/inside/product_screen.dart';
import 'package:flutter_application/src/repository/screens/inside/orders_screen.dart';
import 'package:flutter_application/src/repository/screens/inside/account_screen.dart';

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
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  snapshot.data?[index]['nombre'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
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

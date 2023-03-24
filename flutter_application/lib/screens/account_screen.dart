import 'package:flutter/material.dart';
//Screens
import 'package:flutter_application/screens/principal_screen.dart';
import 'package:flutter_application/screens/orders_screen.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            body(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonAdd(context),
                  const SizedBox(width: 20),
                  buttonCancel(context),
                ],
              ), 
            ),
            bottomNavigationBar(context)
          ],
        )
      )
    );
  }
}

Widget body() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        logo(),
        login(),
        article(),
        cost(),
        description(),
      ],
    ),
  );
}


Widget logo() {
  return const Image(
    image: AssetImage('asset/log.png'),
    height: 100.0,
    width: 100.0,
  );
}

Widget login() {
  return const Text('Cuenta',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ));
}

Widget article() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
    child: const TextField(
      decoration: InputDecoration(hintText: 'Artículo', filled: true, fillColor: Colors.white),
    ),
  );
}

Widget cost() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
    child: const TextField(
      decoration: InputDecoration(hintText: 'Precio', filled: true, fillColor: Colors.white),
    ),
  );
}

Widget description() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
    child: const TextField(
      decoration: InputDecoration(hintText: 'Descripción', filled: true, fillColor: Colors.white),
    ),
  );
}

Widget buttonAdd(BuildContext context) {
  return MaterialButton(
    color: Colors.red, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: const Text('Cancelar',
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));
    },
  );
}

Widget buttonCancel(BuildContext context) {
  return MaterialButton(
    color: Colors.green, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: const Text('Agregar',
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()));
    },
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
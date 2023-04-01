import 'package:flutter/material.dart';
//Screens
import 'package:flutter_application/none/inicio_screen.dart';
import 'package:flutter_application/src/repository/screens/inside/account_screen.dart';
import 'package:flutter_application/src/repository/screens/inside/home_screen.dart';
//ImagenesCortadas
import 'package:image_picker/image_picker.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}


class _OrdersState extends State<Orders> {
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
                  buttonCancel(context),
                  const SizedBox(width: 20),
             
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
        ordenes(),
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

Widget ordenes() {
  return const Text('Ordenes',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ));
}




Widget buttonCancel(BuildContext context) {
  return MaterialButton(
    color: Colors.red, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: const Text('Eliminar Ordenes',
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
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
    unselectedItemColor: Colors.white,
    selectedItemColor: Colors.white,
    onTap: (int index) {
      switch(index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context ) => homeScreen()),
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



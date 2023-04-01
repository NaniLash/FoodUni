import 'package:flutter/material.dart';
import 'package:flutter_application/src/repository/bloc/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Screens
import 'package:flutter_application/src/repository/screens/inside/product_screen.dart';
import 'package:flutter_application/src/repository/screens/inside/orders_screen.dart';
import 'package:flutter_application/src/repository/screens/inside/account_screen.dart';

class homeScreen extends StatelessWidget {
  static Widget create (BuildContext context) => homeScreen();
  
  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      padding: const EdgeInsets.only(top: 30.0),
      color: Colors.white, // Color de fondo rojo
      child: Column(
        children: [
          logo(),
          Container(
            padding:const EdgeInsets.only(top: 10.0), // Contenedor que envuelve al BlocBuilder
            color: Colors.red,
            height: 35,
            child: BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (previous, current) => current is AuthSignedIn,
            
              builder: (_, state) {
                if (state is AuthSignInFailed) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is AuthSignedIn) {
                  final authUser = state.user;
                  return Center(
                    child: Column(
                      children: [
                        Text('Hola ${authUser.uid}!', style: 
                        TextStyle(
                          fontSize: 14.0,
                          color: Colors.white
                        )
                        ,),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
          ),
        ],
      ),
    ),
      
    floatingActionButton: floatingActionButton(context),
    bottomNavigationBar: bottomNavigationBar(context),
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
     unselectedItemColor: Colors.white,
    currentIndex: 0,
    onTap: (int index) {
      switch(index) {
        case 0:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context ) => homeScreen()),
          );
          break;
        case 1:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Orders()),
          );
          break;
        case 2:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Account()),
          );
          break;
      }
    },
  );
}

Widget logo() {
  return const Image(
    image: AssetImage('asset/log.png'),
    height: 100.0,
    width: 100.0,
  );
}
}
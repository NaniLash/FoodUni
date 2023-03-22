import 'package:flutter/material.dart';
import 'package:flutter_application/screens/pages_screen.dart';
import 'package:flutter_application/screens/signin_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              body(),
              button(context),
              buttonSignin(context)
            ]
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
        email(),
        password(),
      ],
    ),
  );
}

Widget login() {
  return const Text('Log In',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ));
}

Widget name() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
    child: const TextField(
      decoration: InputDecoration(hintText: 'Usuario', filled: true, fillColor: Colors.white),
    ),
  );
}

Widget password() {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
      child: const TextField(
        obscureText: true,
        decoration: InputDecoration(hintText: 'Contraseña', filled: true, fillColor: Colors.white),
      ));
}

Widget button(BuildContext context) {
  return MaterialButton(
    color: Colors.red,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: const Text('Iniciar Sesión',
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Inicio()));
    },
  );
}

Widget buttonSignin(BuildContext context) {
  return TextButton(
    child: const Text('Crear Cuenta',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.0,
          decoration: TextDecoration.underline,
          decorationThickness: 1.5
        )),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Signin()));
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

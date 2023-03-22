import 'package:flutter/material.dart';
//Screens
import 'package:flutter_application/screens/login_screen.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              body(),
              button(context)
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
        signin(),
        name(),
        email(),
        password(),
        career()
      ],
    ),
  );
}

Widget signin() {
  return const Text('Sign In',
    style: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    )
  );
}


Widget name() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'Nombre', filled: true, fillColor: Colors.white),
    )
  );
}

Widget email() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
    child: const TextField(
      decoration: InputDecoration(hintText: 'Correo Electrónico', filled: true, fillColor: Colors.white),
    ),
  );
}

Widget password() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: 'Contraseña', filled: true, fillColor: Colors.white),
    )
  );
}

Widget career() {
  List listNames = ['Software', "LAGE", "Manufactura", "Redes", "Ambiental"];

  return Container(
  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
  child: DropdownButtonFormField(
        decoration: const InputDecoration(hintText: 'Carrera', filled: true, fillColor: Colors.white),
        items: listNames.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
        );
      }
    ).toList(), onChanged: (Object? value) {  }
  )
  );
}

Widget button(BuildContext context) {
  return MaterialButton(
    color: Colors.red,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: const Text('Registrarse',
        style: TextStyle(
          color: Colors.white
        )),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
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


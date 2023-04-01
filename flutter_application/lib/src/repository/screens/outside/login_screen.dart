import 'package:flutter/material.dart';
//Firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/src/repository/bloc/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Controlador
  final TextEditingController loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 50.0),
          children: 
            [Column(
              children: [
                body(),
                button(context),
                buttonSignin(context),
                SizedBox(height: 50.0),
                otros(), 
                google(),
                facebook(),
                anonynmous(),
              ]
            ),
          ]
        )
    );
  }

Widget body() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        logo(),
        SizedBox(height: 40.0),
        login(),
        email(),
        password(),
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
  return const Text('Log In (Aun no Dispibible)',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ));
}

Widget otros() {
  return const Text('Otros (Inicia con Google o Anónimo)',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ));
}

Widget email() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
    child: TextField(
      decoration: InputDecoration(hintText: 'Correo Electrónico', filled: true, fillColor: Colors.white),
      controller: loginController,
    
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

Widget button(BuildContext context) {
  return MaterialButton(
    color: Colors.red, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: const Text('Iniciar Sesión',
      style: TextStyle(
        color: Colors.white,
      )
    ),
    onPressed: () async {
      final String login = loginController.text;
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .where('nombre', isEqualTo: login)
          .get();

      if (snapshot.docs.isEmpty) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('El nombre de usuario no existe.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK', style: TextStyle(
                    color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        Navigator.pushNamed(context, '/inicio');
        loginController.clear();
      }
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
      Navigator.pushNamed(context, '/register');
    },
  );
}


Widget google() {
  return Container(
    width: 250, // Establecer el ancho deseado
    child: MaterialButton(
      color: Color.fromARGB(255, 193, 192, 192), 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.white,
            size: 15.0,
          ),
          const SizedBox(width: 10), //Espacio entre la imagen y el texto
          const Text(
            'Iniciar Sesión con Google',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      onPressed: () => {
        context.read<AuthCubit>().signInWithGoogle()
      },
    ),
  );
}


Widget anonynmous() {
  return Container(
    width: 250, // Establecer el ancho deseado
    child: MaterialButton(
      color: Color.fromARGB(255, 129, 99, 248), 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaIcon(
            FontAwesomeIcons.question,
            color: Colors.white,
            size: 15.0,
          ),
          const SizedBox(width: 10), //Espacio entre la imagen y el texto
          const Text(
            'Iniciar Sesión Anónimamente',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      onPressed: () => {
        context.read<AuthCubit>().signInWithGoogle()
      },
    ),
  );
}

Widget facebook() {
  return Container(
    width: 250, // Establecer el ancho deseado
    child: MaterialButton(
      color: Color.fromARGB(255, 79, 98, 180), 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaIcon(
            FontAwesomeIcons.facebook,
            color: Colors.white,
            size: 15.0,
          ),
          const SizedBox(width: 10), //Espacio entre la imagen y el texto
          const Text(
            'Iniciar Sesión con Facebook',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      onPressed: () => {
        
      },
    ),
  );
}
}
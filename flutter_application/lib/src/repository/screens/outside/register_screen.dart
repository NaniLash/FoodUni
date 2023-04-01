import 'package:flutter/material.dart';
//Firebase
import 'package:flutter_application/services/firebase_service.dart';
//Screens
import 'package:flutter_application/src/repository/screens/outside/login_screen.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Controlador 
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 50.0),
            children: 
            [Column(
              children: [
                body(),
                button(context)
              ]
            )
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
    child: TextField(
      //Lo que guardemos en el textfield lo guardara el controlador
      controller: nameController,
      decoration: const InputDecoration(hintText: 'Nombre', filled: true, fillColor: Colors.white),
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
  List listNames = ["Software", "LAGE", "Manufactura", "Redes", "Ambiental"];

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
    //Ponemos la funcion asincrona porque lo que esperamos es un future
    onPressed: () async {
      //Esperamos y el then es "cuando" esperamos que queremos que haga despues de ejecutarse
      await addUser(nameController.text).then((_) => 
        Navigator.pop(context));
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
/*Encapsulamos todo dentro de la case por si queremos usar controladores, 
no nos funcionaria si lo tuvieramos con widgets separados porque no pueden 
entrar a la clase y sacar el controlador, por eso los unimos, los widgets 
dentro de la clase _RegisterState

*/
import 'dart:ffi';

import 'package:flutter/material.dart';
//Screens
import 'package:flutter_application/screens/principal_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            body(),
            buttonImage(context),
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
  return const Text('Agregar Producto',
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

Widget buttonImage(BuildContext context) {
  File imagenn;

  final picker = ImagePicker();

  Future setState(op) async {
    var pickedFile;

    if(op ==1){
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    }else{
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      if(pickedFile != null){
        imagenn =  File(pickedFile.path);
      }else{
        print('No se selecciono ninguna imagen');
      }
    });
    
  }
  
  setState(() {});
  options(context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    setState(1);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
                      
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Tomar Foto", style: TextStyle(
                            fontSize: 16.0,
                            ),
                          ),
                        ),
                        Icon(Icons.camera_alt, color: Colors.black),
                      ],
                    )
                  )
                ),
                InkWell(
                  onTap: (){
                    setState(2);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Seleccionar Una Foto", style: TextStyle(
                            fontSize: 16.0,
                            ),
                          ),
                        ),
                        Icon(Icons.image, color: Colors.black),
                      ],
                    )
                  )
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      border: Border(bottom: BorderSide(width: 1.0, color: Colors.red)),
                      
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Cancelar", style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white
                            ),textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  )
                )
              ],
            ),
          ),
        );
      }
    );
  }

  return Column(
    children: [
      ElevatedButton(
        onPressed: () {
          options(context);
        }, 
        child: Text('Seleccionar una Imagen'),
      ),
      
    ],
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





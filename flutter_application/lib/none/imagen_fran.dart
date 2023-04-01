import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//Screens
import 'package:flutter_application/none/inicio_screen.dart';
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
            Card_PerfilPhoto(),
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


Widget buttonAdd(BuildContext context) {
  return MaterialButton(
    color: Colors.green, 
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: const Text('Agregar',
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      
    },
  );
}

Widget buttonCancel(BuildContext context) {
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

class Card_PerfilPhoto extends StatefulWidget {
  const Card_PerfilPhoto({super.key});

  @override
  State<Card_PerfilPhoto> createState() => _Card_PerfilPhotoState();
}

class _Card_PerfilPhotoState extends State<Card_PerfilPhoto> {
  bool _isClicked = false;
  File? _image;

  Future _image_(String source) async {
    try{
      // ignore: prefer_typing_uninitialized_variables
      final image;
      if(source == 'gallery'){
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
      }
      else{
        image = await ImagePicker().pickImage(source: ImageSource.camera);
      }
      if (image == null) return;
      setState(() {
        _image = File(image.path);

      });
    }
    on PlatformException catch (e) {
      print(e);
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 280),
        //Boton inicial
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: 
          _image == null
            ? TextButton(
              onPressed: () {
                setState(() {
                  _isClicked = !_isClicked;
                });
              },
              style: TextButton.styleFrom(                          
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
              ),
              child: const Icon(
                  Icons.image,
                  size: 100,
                )
            )
            : TextButton(
              onPressed: () {
                setState(() {
                  _isClicked = !_isClicked;
                });
              },
              style: TextButton.styleFrom(                          
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
              ),
              child:  Container(
                width: 162,
                height: 165,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(_image!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color:Colors.red
                ),
              ),
            ),
        ),
        //Botones emergentes
        _isClicked ? Positioned(
          top: 5,
          left: 210,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                  _image_('camera');
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
                child: const Icon(
                Icons.camera,
                  size: 30,
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                  _image_('gallery');
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
                child: const Icon(
                  Icons.image,
                  size: 30,
                ),
              ),
            ],
          )
        )
        : const SizedBox.shrink(),
      ],
    );
  }
}
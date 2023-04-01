import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Algo que vendra en el futuro o una promesa
Future<List> getUser() async {
  List user = [];
  //Hacemos referencia a la coleccion en especifico
  CollectionReference collectionReferenceUser = db.collection('user');

  //Hacemos la query que nos traiga la informacion y trae TODOS
  //Por ende debemos de usar una query diferente
  QuerySnapshot queryUser = await collectionReferenceUser.get();

  //Iteracion de contenido, documento es el numero de usuarios
  queryUser.docs.forEach((documento) {
    //La data es por ejemplo nombre: Arturo de la BD
    user.add(documento.data());
  });
  return user;
}

//Void de que no regresa nada o un mensaje de error, lo que queramos
Future<void> addUser(String name) async {
  await db.collection('user').add({'nombre': name});
}
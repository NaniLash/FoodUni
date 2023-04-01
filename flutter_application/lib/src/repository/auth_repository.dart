import 'package:equatable/equatable.dart';

class AuthUser extends Equatable{
  final String? uid;
  final String? email;

  AuthUser(this.uid, this.email);

  
  @override
  List<Object?> get props => throw [uid];
}


abstract class AuthRepositoryBase{

  Stream<AuthUser?> get onAuthStateChanged;

//Ponemos nuestro usuario que nos regresar al hacer login <AuthUser>
//Puede regresar usuario o null
  Future<AuthUser?> signInAnonymously();

  Future<AuthUser?> signInWithGoogle();

//Cerrar sesion
  Future<void> signOut();
}
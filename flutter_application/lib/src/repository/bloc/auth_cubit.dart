import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../auth_repository.dart';

//Le pasamos al cubit la clase de estado padre
class AuthCubit extends Cubit<AuthState> {
  //El cubit necesita repositorio y lo pasamos por el contructor
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;

  //Constructor y su estado incial es AuthInitialState
  AuthCubit(this._authRepository) : super(AuthInitialState());

  //Funcion para inicializar

  Future<void> init() async {
    //Llamamos al repositorio para inicializar

    //Cada que inicia o cierra sesion se llama a la funcion onAuthStateChanged y se emite un estado
    _authSubscription = _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

//Si el usuario es nulo no inicio sesion, de lo contrario emitimos que inicio sesion
  void _authStateChanged(AuthUser? user) => user == null? emit(AuthSignedOut()) : emit(AuthSignedIn(user));

    //INICIAR SESION ANONIMAMENTE
    //Cuando llamamos la funcion signInAnonymously se manda a llamar a _signIn
    Future<void> signInAnonymously() => _signIn(_authRepository.signInAnonymously());

    Future<void> signInWithGoogle() => _signIn(_authRepository.signInWithGoogle());

    //Funcion para indicarle al usuario que estamos iniciado sesion
    Future<void> _signIn(Future<AuthUser?> auxUser) async {
      //Cuando se llama la funcion emitimos el estado 
      try{
        emit(AuthSigningIn());
        final user = await auxUser;
        if (user == null) {
          //Si es null el usuario significa que hubo error al iniciar sesion
          emit(AuthSignInFailed('Hubo un error al iniciar sesion'));
        }else{
          //Si el usuario inicio sesion correctamente
          emit(AuthSignedIn(user));
        }
      }catch(e){
        emit(AuthSignInFailed('Error: ${e.toString()}'));
      }
    }

    Future<void> signOut() async{
      //Mandamos a llamar al repositorio y salimos
      await _authRepository.signOut();
      emit(AuthSignedOut());
    }

    //Cerramos suscripcion
    @override
    Future<void> close() {
      _authSubscription.cancel();
      return super.close();
    }
  }


//Estado padre 
abstract class AuthState extends Equatable {
@override
  List<Object?> get props => [];
}

//Primer estado Inicial
class AuthInitialState extends AuthState {

}

//Estado cuando no ha iniciado sesion usuario
class AuthSignedOut extends AuthState {

}

//Estado de carga cuando inicias sesion
class AuthSigningIn extends AuthState {

}

//Si quieres iniciar sesion y hay un error
class AuthSignInFailed extends AuthState {
  final String message;
  AuthSignInFailed(this.message);
  @override
  List<Object?> get props => [message];
}

//Estado cuando ha iniciado sesion usuario
class AuthSignedIn extends AuthState {
  //El estado trndra un user
  final AuthUser user;
  //Inicializamos user con su constructor
  AuthSignedIn(this.user);
  @override
  List<Object?> get props => [user];
}


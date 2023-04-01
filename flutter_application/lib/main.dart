import 'package:flutter/material.dart';
//Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/src/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
//Cubit
import 'package:flutter_application/src/repository/bloc/auth_cubit.dart';
import 'package:flutter_application/src/repository/implementation/auth_repository.dart';
//Screens


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  final authCubit = AuthCubit(AuthRepository());

  runApp(BlocProvider(
    //Lo tenemos que inicializar
    create: (_) => authCubit..init() , 
    child: MyApp.create(),
    ),
  );
}
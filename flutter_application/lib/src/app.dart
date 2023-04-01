import 'package:flutter/material.dart';
//Screens
import 'package:flutter_application/src/repository/screens/outside/login_screen.dart';
import 'package:flutter_application/src/repository/screens/outside/register_screen.dart';
import 'package:flutter_application/none/inicio_screen.dart';
import 'package:flutter_application/src/repository/screens/inside/home_screen.dart';

//Cubit
import 'package:flutter_application/src/repository/bloc/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Para navegar 
final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
//Conexion con Main.dart
  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        //Logica de si ya inicio sesion lo mando a pantalla inicial y si no al login
        if (state is AuthSignedOut) {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil('/', (route) => false);
        }else if (state is AuthSignedIn) {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil('/home', (route) => true);
        }
      },
      child: const MyApp(),
    );
  }


  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Le pasamos lo que pusimos hasta arriva para la navegacion
      navigatorKey: _navigatorKey,
      title: 'lutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/register': (context) => const Register(),
        '/inicio': (context) => const Inicio(),
        '/home' : (context) => homeScreen(),
      },
    );
  }
}
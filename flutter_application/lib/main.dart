import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "FoodUni",
      //SafeArea respeta el contenido de la pantalla de Android
      home: SafeArea(
        child: MyApp()
      ),
    )
  );
}

class MyApp extends StatelessWidget { 
  //Constructor
  const MyApp ({super.key});
  
  @override
  //El metodo build se usa para definir la apariencia y estructura de un widget
  Widget build(BuildContext context) {
    //Widget de material design
    return Material(
      child: Column(
        children: [
        
          Container(
            height: 50,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: Colors.red),
            child: Row(
              children: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.menu),
                  tooltip: 'Boton de Navegacion',
                ),
                Expanded(
                  child: Text('App Hola Mundo')
                ),
                IconButton(
                  onPressed: null, 
                  icon: Icon(Icons.search), 
                  tooltip: 'Boton de Busqueda',
                ),
              ],
            ),
          ),

          const Expanded(
            child: Center(
              child: Text(
                'Hola Mundo', 
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
        ],
      ), 
    );
  }

}



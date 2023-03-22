Widget cuerpo(){


  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('asset/log.png'),
        fit: BoxFit.cover,
      )
    ),
    //Si no se lo pones toda la imagen se hara pequena junto con el texto
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Image.file(File('/assets/img/food.jpg')),
          nombre(), 
          fildUser(),
          password(),
          button()
        ],
      ),
      
      ),
  );
}
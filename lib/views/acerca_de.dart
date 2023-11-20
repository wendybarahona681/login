import 'package:flutter/material.dart';

class Acercade extends StatelessWidget {
  // Datos de ambos
  final String names = 'Wendy Barahona \n Andrea Molina'; // Nombres de ambos
  final String emails =
      'barahonawendy681@gmail.com\n andreamolina203@gmail.com'; // Correos de ambos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de nosotros'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             //Imagen con ambas fotos
            Image.asset(
               'imagenes/foto.jpeg', // Ruta de la imagen combinada
              width: 150.0,
              height: 150.0,
            ),
            const SizedBox(height: 20.0),
            Text(
              names,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              emails,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
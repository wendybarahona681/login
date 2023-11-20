
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/crud.dart';

class EditCategoria extends StatefulWidget {
  
  const EditCategoria({Key? key, });

  @override
  State<EditCategoria> createState() => _EditCategoriaScreenState();
}

class _EditCategoriaScreenState extends State<EditCategoria> {
  final TextEditingController _idController = TextEditingController(text: "");

  final TextEditingController _nombreController =
      TextEditingController(text: "");

  final TextEditingController _estadoController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    _idController.text = arguments['id'] ?? '';

    _nombreController.text = arguments['nombre'];

    _estadoController.text = arguments['estado'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editando Categoría'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              'Información de la Categoría',
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _idController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite el ID de la categoría',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _nombreController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite el nombre de la categoría',
                prefixIcon: Icon(
                  Icons.category,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _estadoController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite el estado de la categoría',
                prefixIcon: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final id = _idController.text;

                final nombre = _nombreController.text;

                final estado = _estadoController.text;

                if (id.isNotEmpty && nombre.isNotEmpty && estado.isNotEmpty) {
                  await editCategoria(id, nombre, estado).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Campos Vacíos'),
                        content: Text('Por favor, complete todos los campos.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Aceptar'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Actualizar'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getChat();
  }

  void getChat() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("tb_categoria");
    QuerySnapshot mensajes = await collectionReference.get();
    if (mensajes.docs.isNotEmpty) {
      for (var doc in mensajes.docs) {
        print(doc.data());
        //chatsx.add(doc.data());
      }
    }
  }
}



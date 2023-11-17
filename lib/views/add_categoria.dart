import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login/models/crud.dart';

class AddCategoria extends StatefulWidget {
  const AddCategoria({Key? key});

  @override
  State<AddCategoria> createState() => _AddCategoriaState();
}

class _AddCategoriaState extends State<AddCategoria> {
  final TextEditingController _idController = TextEditingController(text: "");
  final TextEditingController _nombreController =
  TextEditingController(text: "");
  final TextEditingController _estadoController =
  TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Categoría'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              'Datos de la Categoría',
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
                hintText: 'ID de categoría',
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.red,
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
                hintText: ' Nombre de la categoría',
                prefixIcon: Icon(
                  Icons.category_outlined,
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
                hintText: ' Estado de la categoría',
                prefixIcon: Icon(
                  Icons.check,
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
                  await addCategoria(id, nombre, estado).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Campos Vacíos'),
                        content:
                        const Text('Por favor, complete todos los campos.'),
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
              child: const Text('Guardar'),
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
    if (mensajes.docs.length != 0) {
      for (var doc in mensajes.docs) {
        print(doc.data());
        //chatsx.add(doc.data());
      }
    }
  }
}
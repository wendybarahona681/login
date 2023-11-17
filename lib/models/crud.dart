import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getCategorias() async {
  List<Map<String, dynamic>> categorias = [];
  CollectionReference collectionReference = db.collection('tb_categoria');
  QuerySnapshot querySnapshot = await collectionReference.get();

  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final categoria = {
      "id": doc.id,
      "nombre": data["nombre"],
      "estado": data["estado"],
    };
    categorias.add(categoria);
  }
  return categorias;
}

Future<void> addCategoria(String id, String nombre, String estado) async {
  await db
      .collection('tb_categoria')
      .add({"id": id, "nombre": nombre, "estado": estado});
}

Future<void> editCategoria(String id, String nombre, String estado) async {
  await db
      .collection('tb_categoria')
      .doc(id)
      .update({"id": id, "nombre": nombre, "estado": estado});
}

Future<void> deleteCategoria(String id) async {
  await db.collection('tb_categoria').doc(id).delete();
}
// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future updateColorToFalse(int storeNumber) async {
  try {
    // Referencia a la colección top300
    final top300Collection = FirebaseFirestore.instance.collection('top300');

    // Consulta los documentos que tienen Tienda igual al número que pasamos
    final querySnapshot =
        await top300Collection.where('Tienda', isEqualTo: storeNumber).get();

    // Crea un batch para realizar múltiples actualizaciones
    WriteBatch batch = FirebaseFirestore.instance.batch();

    // Itera sobre los documentos y agrégales la actualización al batch
    for (var doc in querySnapshot.docs) {
      final docRef = top300Collection.doc(doc.id);

      // Agrega la actualización al batch
      batch.update(docRef, {
        'Color': 0, // Actualiza el campo Color a 0 (valor entero)
      });
    }

    // Ejecuta el batch de una sola vez
    await batch.commit();

    print(
        'Todos los documentos con Tienda == $storeNumber han sido actualizados correctamente.');
  } catch (e) {
    print('Error al actualizar documentos: $e');
  }
}

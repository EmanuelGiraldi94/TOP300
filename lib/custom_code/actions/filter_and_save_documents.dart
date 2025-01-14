// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart'; // Importa el paquete uuid

Future filterAndSaveDocuments() async {
  try {
    // Referencia a las colecciones
    final top300Collection = FirebaseFirestore.instance.collection('top300');
    final t3608Collection = FirebaseFirestore.instance.collection('T3608');

    // Crea una instancia de Uuid para generar un único ID para cada acción
    var uuid = Uuid();
    final uniqueID = uuid.v4(); // Genera un ID único para esta acción

    // Consulta los documentos que tienen Tienda == 3608
    final querySnapshot =
        await top300Collection.where('Tienda', isEqualTo: 3608).get();

    // Itera sobre cada documento y guárdalo en la colección T3608
    for (var doc in querySnapshot.docs) {
      final data = doc.data();

      // Modifica los datos agregando el IDcontrol único
      final newData = {
        ...data, // Copia todos los datos del documento original
        'IDcontrol': uniqueID, // Agrega el IDcontrol único
      };

      // Guarda el documento en la nueva colección
      await t3608Collection.add(newData);
    }

    print(
        'Documentos filtrados y guardados correctamente en T3608 con el mismo IDcontrol.');
  } catch (e) {
    print('Error al filtrar y guardar documentos: $e');
  }
}

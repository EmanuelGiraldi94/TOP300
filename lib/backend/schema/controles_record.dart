import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ControlesRecord extends FirestoreRecord {
  ControlesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Tienda" field.
  int? _tienda;
  int get tienda => _tienda ?? 0;
  bool hasTienda() => _tienda != null;

  // "FechaInicio" field.
  DateTime? _fechaInicio;
  DateTime? get fechaInicio => _fechaInicio;
  bool hasFechaInicio() => _fechaInicio != null;

  // "FechaFinalizado" field.
  DateTime? _fechaFinalizado;
  DateTime? get fechaFinalizado => _fechaFinalizado;
  bool hasFechaFinalizado() => _fechaFinalizado != null;

  void _initializeFields() {
    _tienda = castToType<int>(snapshotData['Tienda']);
    _fechaInicio = snapshotData['FechaInicio'] as DateTime?;
    _fechaFinalizado = snapshotData['FechaFinalizado'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Controles');

  static Stream<ControlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ControlesRecord.fromSnapshot(s));

  static Future<ControlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ControlesRecord.fromSnapshot(s));

  static ControlesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ControlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ControlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ControlesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ControlesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ControlesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createControlesRecordData({
  int? tienda,
  DateTime? fechaInicio,
  DateTime? fechaFinalizado,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Tienda': tienda,
      'FechaInicio': fechaInicio,
      'FechaFinalizado': fechaFinalizado,
    }.withoutNulls,
  );

  return firestoreData;
}

class ControlesRecordDocumentEquality implements Equality<ControlesRecord> {
  const ControlesRecordDocumentEquality();

  @override
  bool equals(ControlesRecord? e1, ControlesRecord? e2) {
    return e1?.tienda == e2?.tienda &&
        e1?.fechaInicio == e2?.fechaInicio &&
        e1?.fechaFinalizado == e2?.fechaFinalizado;
  }

  @override
  int hash(ControlesRecord? e) => const ListEquality()
      .hash([e?.tienda, e?.fechaInicio, e?.fechaFinalizado]);

  @override
  bool isValidKey(Object? o) => o is ControlesRecord;
}

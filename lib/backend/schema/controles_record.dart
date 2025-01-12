import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ControlesRecord extends FirestoreRecord {
  ControlesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Tienda" field.
  int? _tienda;
  int get tienda => _tienda ?? 0;
  bool hasTienda() => _tienda != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _tienda = castToType<int>(snapshotData['Tienda']);
    _fecha = snapshotData['Fecha'] as DateTime?;
    _id = castToType<int>(snapshotData['ID']);
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
  DateTime? fecha,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Tienda': tienda,
      'Fecha': fecha,
      'ID': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ControlesRecordDocumentEquality implements Equality<ControlesRecord> {
  const ControlesRecordDocumentEquality();

  @override
  bool equals(ControlesRecord? e1, ControlesRecord? e2) {
    return e1?.tienda == e2?.tienda &&
        e1?.fecha == e2?.fecha &&
        e1?.id == e2?.id;
  }

  @override
  int hash(ControlesRecord? e) =>
      const ListEquality().hash([e?.tienda, e?.fecha, e?.id]);

  @override
  bool isValidKey(Object? o) => o is ControlesRecord;
}

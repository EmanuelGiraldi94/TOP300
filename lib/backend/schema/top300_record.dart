import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Top300Record extends FirestoreRecord {
  Top300Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Departamento" field.
  int? _departamento;
  int get departamento => _departamento ?? 0;
  bool hasDepartamento() => _departamento != null;

  // "Tienda" field.
  int? _tienda;
  int get tienda => _tienda ?? 0;
  bool hasTienda() => _tienda != null;

  // "SKU" field.
  int? _sku;
  int get sku => _sku ?? 0;
  bool hasSku() => _sku != null;

  // "Producto" field.
  String? _producto;
  String get producto => _producto ?? '';
  bool hasProducto() => _producto != null;

  // "Stock" field.
  String? _stock;
  String get stock => _stock ?? '';
  bool hasStock() => _stock != null;

  // "Color" field.
  int? _color;
  int get color => _color ?? 0;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _departamento = castToType<int>(snapshotData['Departamento']);
    _tienda = castToType<int>(snapshotData['Tienda']);
    _sku = castToType<int>(snapshotData['SKU']);
    _producto = snapshotData['Producto'] as String?;
    _stock = snapshotData['Stock'] as String?;
    _color = castToType<int>(snapshotData['Color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('top300');

  static Stream<Top300Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Top300Record.fromSnapshot(s));

  static Future<Top300Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Top300Record.fromSnapshot(s));

  static Top300Record fromSnapshot(DocumentSnapshot snapshot) => Top300Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Top300Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Top300Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Top300Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Top300Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTop300RecordData({
  int? departamento,
  int? tienda,
  int? sku,
  String? producto,
  String? stock,
  int? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Departamento': departamento,
      'Tienda': tienda,
      'SKU': sku,
      'Producto': producto,
      'Stock': stock,
      'Color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class Top300RecordDocumentEquality implements Equality<Top300Record> {
  const Top300RecordDocumentEquality();

  @override
  bool equals(Top300Record? e1, Top300Record? e2) {
    return e1?.departamento == e2?.departamento &&
        e1?.tienda == e2?.tienda &&
        e1?.sku == e2?.sku &&
        e1?.producto == e2?.producto &&
        e1?.stock == e2?.stock &&
        e1?.color == e2?.color;
  }

  @override
  int hash(Top300Record? e) => const ListEquality().hash(
      [e?.departamento, e?.tienda, e?.sku, e?.producto, e?.stock, e?.color]);

  @override
  bool isValidKey(Object? o) => o is Top300Record;
}

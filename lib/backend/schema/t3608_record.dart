import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class T3608Record extends FirestoreRecord {
  T3608Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Departamento" field.
  int? _departamento;
  int get departamento => _departamento ?? 0;
  bool hasDepartamento() => _departamento != null;

  // "Producto" field.
  String? _producto;
  String get producto => _producto ?? '';
  bool hasProducto() => _producto != null;

  // "SKU" field.
  int? _sku;
  int get sku => _sku ?? 0;
  bool hasSku() => _sku != null;

  // "Tienda" field.
  int? _tienda;
  int get tienda => _tienda ?? 0;
  bool hasTienda() => _tienda != null;

  // "Stock" field.
  String? _stock;
  String get stock => _stock ?? '';
  bool hasStock() => _stock != null;

  // "IDcontrol" field.
  int? _iDcontrol;
  int get iDcontrol => _iDcontrol ?? 0;
  bool hasIDcontrol() => _iDcontrol != null;

  // "Color" field.
  bool? _color;
  bool get color => _color ?? false;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _departamento = castToType<int>(snapshotData['Departamento']);
    _producto = snapshotData['Producto'] as String?;
    _sku = castToType<int>(snapshotData['SKU']);
    _tienda = castToType<int>(snapshotData['Tienda']);
    _stock = snapshotData['Stock'] as String?;
    _iDcontrol = castToType<int>(snapshotData['IDcontrol']);
    _color = snapshotData['Color'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('T3608');

  static Stream<T3608Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => T3608Record.fromSnapshot(s));

  static Future<T3608Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => T3608Record.fromSnapshot(s));

  static T3608Record fromSnapshot(DocumentSnapshot snapshot) => T3608Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static T3608Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      T3608Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'T3608Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is T3608Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createT3608RecordData({
  int? departamento,
  String? producto,
  int? sku,
  int? tienda,
  String? stock,
  int? iDcontrol,
  bool? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Departamento': departamento,
      'Producto': producto,
      'SKU': sku,
      'Tienda': tienda,
      'Stock': stock,
      'IDcontrol': iDcontrol,
      'Color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class T3608RecordDocumentEquality implements Equality<T3608Record> {
  const T3608RecordDocumentEquality();

  @override
  bool equals(T3608Record? e1, T3608Record? e2) {
    return e1?.departamento == e2?.departamento &&
        e1?.producto == e2?.producto &&
        e1?.sku == e2?.sku &&
        e1?.tienda == e2?.tienda &&
        e1?.stock == e2?.stock &&
        e1?.iDcontrol == e2?.iDcontrol &&
        e1?.color == e2?.color;
  }

  @override
  int hash(T3608Record? e) => const ListEquality().hash([
        e?.departamento,
        e?.producto,
        e?.sku,
        e?.tienda,
        e?.stock,
        e?.iDcontrol,
        e?.color
      ]);

  @override
  bool isValidKey(Object? o) => o is T3608Record;
}

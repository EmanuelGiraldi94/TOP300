import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _contrasea = prefs.getString('ff_contrasea') ?? _contrasea;
    });
    _safeInit(() {
      _TiendaNum = prefs.getString('ff_TiendaNum') ?? _TiendaNum;
    });
    _safeInit(() {
      _numeroTienda = prefs.getInt('ff_numeroTienda') ?? _numeroTienda;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _contrasea = '';
  String get contrasea => _contrasea;
  set contrasea(String value) {
    _contrasea = value;
    prefs.setString('ff_contrasea', value);
  }

  String _Cpunt = '';
  String get Cpunt => _Cpunt;
  set Cpunt(String value) {
    _Cpunt = value;
  }

  String _TiendaNum = '';
  String get TiendaNum => _TiendaNum;
  set TiendaNum(String value) {
    _TiendaNum = value;
    prefs.setString('ff_TiendaNum', value);
  }

  int _numeroTienda = 0;
  int get numeroTienda => _numeroTienda;
  set numeroTienda(int value) {
    _numeroTienda = value;
    prefs.setInt('ff_numeroTienda', value);
  }

  bool _FilterVisible = false;
  bool get FilterVisible => _FilterVisible;
  set FilterVisible(bool value) {
    _FilterVisible = value;
  }

  int _Green = 1;
  int get Green => _Green;
  set Green(int value) {
    _Green = value;
  }

  int _Red = 2;
  int get Red => _Red;
  set Red(int value) {
    _Red = value;
  }

  String _TotalTiendas = '';
  String get TotalTiendas => _TotalTiendas;
  set TotalTiendas(String value) {
    _TotalTiendas = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

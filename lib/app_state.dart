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
      _numeroTienda = prefs.getString('ff_numeroTienda') ?? _numeroTienda;
    });
    _safeInit(() {
      _contrasea = prefs.getString('ff_contrasea') ?? _contrasea;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _numeroTienda = '';
  String get numeroTienda => _numeroTienda;
  set numeroTienda(String value) {
    _numeroTienda = value;
    prefs.setString('ff_numeroTienda', value);
  }

  String _contrasea = '';
  String get contrasea => _contrasea;
  set contrasea(String value) {
    _contrasea = value;
    prefs.setString('ff_contrasea', value);
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

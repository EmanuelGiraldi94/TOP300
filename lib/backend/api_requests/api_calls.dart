import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetTiendaCall {
  static Future<ApiCallResponse> call({
    String? tiendanum = '',
    String? deptonum = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTienda',
      apiUrl:
          'http://186.182.243.208:3000/top300?tienda=$tiendanum&depto=$deptonum',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? deptoAPI(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].Depto''',
      ));
  static int? skuapi(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].SKU''',
      ));
  static String? descAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Descrip''',
      ));
  static int? stockAPI(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].Stock''',
      ));
  static List<int>? tiendaAPI(dynamic response) => (getJsonField(
        response,
        r'''$[:].Tienda''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class UpdatecolorCall {
  static Future<ApiCallResponse> call({
    String? tiendaUpdate = '3608',
    String? skuUpdate = '211101303',
    int? colorUpdate = 1,
  }) async {
    final ffApiRequestBody = '''
{
  "color": $colorUpdate
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updatecolor',
      apiUrl:
          'http://186.182.243.208:3000/update-color/$skuUpdate/$tiendaUpdate',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ContarCall {
  static Future<ApiCallResponse> call({
    String? tiendacount = '3608',
    String? deptocount = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Contar',
      apiUrl:
          'http://186.182.243.208:3000/count-items/$tiendacount?depto=$deptocount',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? totalitems(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_items''',
      ));
}

class CreateRerpotCall {
  static Future<ApiCallResponse> call({
    String? fechaCreacion = '',
    String? estado = '',
    String? tienda = '3608',
  }) async {
    final ffApiRequestBody = '''
{
  "tienda": "${escapeStringForJson(tienda)}",
  "estado": "${escapeStringForJson(estado)}",
  "fechaCreacion": "${escapeStringForJson(fechaCreacion)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateRerpot',
      apiUrl: 'http://186.182.243.208:3000/reportes$tienda',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetReportesCall {
  static Future<ApiCallResponse> call({
    String? tiendaGR = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetReportes',
      apiUrl: 'http://186.182.243.208:3000/reportes$tiendaGR',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? fechaCreaReport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].fecha_creacion''',
      ));
  static String? tiendaReport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].tienda''',
      ));
  static String? estadoReport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].estado''',
      ));
  static String? rojosReport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].rojos''',
      ));
  static String? verdesReport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].verdes''',
      ));
  static String? itemReport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].cantidad_item''',
      ));
  static String? fechaFReport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].fecha_finalizacion''',
      ));
}

class UpdateReporteCall {
  static Future<ApiCallResponse> call({
    String? tiendaR = '',
    String? fechaR = '',
    String? estadoR = '',
    String? fechaFR = '',
    int? rojoR = 0,
    int? verdeR = 0,
    int? itemR = 0,
  }) async {
    final ffApiRequestBody = '''
{
  "estado": "${escapeStringForJson(estadoR)}",
  "cantidadItem": $itemR,
  "rojos": $rojoR,
  "verdes": $verdeR,
  "fechaFinalizacion": "${escapeStringForJson(fechaFR)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateReporte',
      apiUrl: 'http://186.182.243.208:3000/reportes/$tiendaR/$fechaR',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetColorsReportCall {
  static Future<ApiCallResponse> call({
    String? tiendacolor = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetColorsReport',
      apiUrl:
          'http://186.182.243.208:3000/count-color-values/$tiendacolor/reportes$tiendacolor',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? verdeGet(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.count_color_1''',
      ));
  static String? rojoGet(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.count_color_2''',
      ));
  static int? totalcolorGet(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_colors''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

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

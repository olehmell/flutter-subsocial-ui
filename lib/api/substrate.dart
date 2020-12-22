import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/models/models.dart';
import 'package:http/http.dart' as http;

class RpcMethod {
  String method;
  String moduleName;

  RpcMethod({@required this.moduleName, @required this.method});
}

class RpcCommonParams {
  int offset;
  int limit;

  RpcCommonParams(this.offset, this.limit);

  List toList() {
    return [this.offset, this.limit];
  }
}

class SubstrateRpcApi {
  final _rpcUrl;
  final _httpClient = http.Client();

  SubstrateRpcApi(this._rpcUrl);

  Map<String, dynamic> _createRpcQuery(RpcMethod rpcMethod, List params) {
    return {
      'jsonrpc': '2.0',
      'id': '1',
      'method': '${rpcMethod.moduleName}_${rpcMethod.method}',
      'params': [null, ...params].toString()
    };
  }

  Future<dynamic> _rpcQuery(RpcMethod rpcMethod, List params) async {
    print(_createRpcQuery(rpcMethod, params));
    final response = await _httpClient.post(_rpcUrl,
        body: _createRpcQuery(rpcMethod, params));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return body.result;
    }
    throw Exception('error fetching posts');
  }

  Future<List<Space>> getPublicSpaces(RpcCommonParams params) async {
    final data = await _rpcQuery(
        RpcMethod(moduleName: 'spaces', method: 'getPublicSpaces'),
        params.toList()) as List<dynamic>;
    print('DATA: $data');
    return data.map((e) => Space.fromJson(e));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/api/utils.dart';
import 'package:flutter_infinite_list/models/models.dart';

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
  final String _rpcUrl;

  SubstrateRpcApi(this._rpcUrl);

  Map<String, dynamic> _createRpcQuery(RpcMethod rpcMethod, List params) {
    return {
      'jsonrpc': '2.0',
      'id': 1,
      'method': '${rpcMethod.moduleName}_${rpcMethod.method}',
      'params': [null, ...params]
    };
  }

  Future<dynamic> _rpcQuery(RpcMethod rpcMethod, List params) async {
    print(_createRpcQuery(rpcMethod, params));
    final data = await postJsonRequest(
        url: _rpcUrl, data: _createRpcQuery(rpcMethod, params));

    return data['result'] ?? null;
  }

  Future<List<Space>> getPublicSpaces(RpcCommonParams params) async {
    final data = List.from(await _rpcQuery(
        RpcMethod(moduleName: 'spaces', method: 'getPublicSpaces'),
        params.toList()));

    final dataList = data != null ? List.from(data) : [];

    print(dataList.length);

    final spaces = dataList.map((e) => Space.fromJson(e)).toList();
    return spaces;
  }
}

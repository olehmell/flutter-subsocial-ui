import 'package:flutter_infinite_list/api/utils.dart';

class IpfsApi {
  final String _offchainUrl;

  IpfsApi(this._offchainUrl);

  Future<Map<String, Map<String, String>>> getContentArray(
      List<String> cids) async {
    final data =
        await postJsonRequest(url: '$_offchainUrl/ipfs/get', data: cids);
    print(data);
    return data;
  }

  //   Future<Map<String, Map<String, String>>> getContentArray(
  //     List<String> cids) async {
  //   final cidsParams = cids.join('&cids=');
  //   final data = await http.get('$_offchainUrl/ipfs/get?$cidsParams');
  //   print(data);
  //   if (data.statusCode == 200) {
  //     return json.decode(data.body);
  //   }

  //   return null;
  // }

  Future<Map<String, String>> getContent(String cid) async {
    final data = await getContentArray([cid]);
    print(data);
    return data[cid];
  }
}

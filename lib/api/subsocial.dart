import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/api/ipfs.dart';
import 'package:flutter_infinite_list/api/substrate.dart';
import 'package:flutter_infinite_list/models/space.dart';

class SubsocialApi {
  SubstrateRpcApi rpc;
  IpfsApi ipfs;

  SubsocialApi({@required rpcUrl, @required offchainUrl})
      : this.rpc = SubstrateRpcApi(rpcUrl),
        this.ipfs = IpfsApi(offchainUrl);

  Future<List<SpaceData>> getPublicSpaces(RpcCommonParams params) async {
    final structs = await rpc.getPublicSpaces(params);
    // final cids = structs.map((struct) => struct.contentId).toList();

    // final contents = await ipfs.getContentArray(cids);

    return structs.map((struct) {
      return SpaceData(
        struct: struct,
        /* content: SpaceContent.fromJson(contents[struct.contentId]) */
      );
    }).toList();
  }
}

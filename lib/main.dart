import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/api/substrate.dart';
import 'package:flutter_infinite_list/app.dart';
import 'package:flutter_infinite_list/simple_bloc_observer.dart';

void main() async {
  final substrateRpcApi = SubstrateRpcApi('http://localhost:9933');
  final space = await substrateRpcApi.getPublicSpaces(RpcCommonParams(0, 20));
  print(space);
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

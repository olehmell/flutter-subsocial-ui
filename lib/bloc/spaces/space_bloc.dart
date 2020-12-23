import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_infinite_list/api/substrate.dart';
import 'package:flutter_infinite_list/models/space.dart';
import 'package:rxdart/rxdart.dart';

part 'space_event.dart';
part 'space_state.dart';

const _spaceLimit = 20;

class SpaceBloc extends Bloc<SpaceEvent, SpaceState> {
  int offset = 0;
  SpaceBloc() : super(const SpaceState());

  @override
  Stream<Transition<SpaceEvent, SpaceState>> transformEvents(
    Stream<SpaceEvent> events,
    TransitionFunction<SpaceEvent, SpaceState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<SpaceState> mapEventToState(SpaceEvent event) async* {
    if (event is SpaceFetched) {
      yield await _mapSpaceFetchedToState(state);
    }
  }

  Future<SpaceState> _mapSpaceFetchedToState(SpaceState state) async {
    print(state.hasReachedMax);
    if (state.hasReachedMax) return state;
    try {
      if (state.status == SpaceStatus.initial) {
        final spaces = await _fetchSpaces();
        return state.copyWith(
          status: SpaceStatus.success,
          spaces: spaces,
          hasReachedMax: _hasReachedMax(spaces.length),
        );
      }
      final spaces = await _fetchSpaces(state.spaces.length);
      print(spaces);
      return spaces.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: SpaceStatus.success,
              spaces: List.of(state.spaces)..addAll(spaces),
              hasReachedMax: _hasReachedMax(spaces.length),
            );
    } on Exception {
      return state.copyWith(status: SpaceStatus.failure);
    }
  }

  Future<List<Space>> _fetchSpaces([int startIndex = 0]) async {
    final substrateRpcApi = SubstrateRpcApi('http://10.0.2.2:9933');
    print('Offset: $offset');
    final spaces = await substrateRpcApi
        .getPublicSpaces(RpcCommonParams(offset, _spaceLimit));
    offset = spaces.last.id + 1;
    return spaces;
  }

  bool _hasReachedMax(int spacesCount) =>
      spacesCount < _spaceLimit ? true : false;
}

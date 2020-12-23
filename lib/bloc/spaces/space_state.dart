part of 'space_bloc.dart';

enum SpaceStatus { initial, success, failure }

class SpaceState extends Equatable {
  const SpaceState({
    this.status = SpaceStatus.initial,
    this.spaces = const <Space>[],
    this.hasReachedMax = false,
  });

  final SpaceStatus status;
  final List<Space> spaces;
  final bool hasReachedMax;

  SpaceState copyWith({
    SpaceStatus status,
    List<Space> spaces,
    bool hasReachedMax,
  }) {
    return SpaceState(
      status: status ?? this.status,
      spaces: spaces ?? this.spaces,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, spaces, hasReachedMax];
}

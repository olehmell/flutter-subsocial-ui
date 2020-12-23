part of 'space_bloc.dart';

abstract class SpaceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SpaceFetched extends SpaceEvent {}

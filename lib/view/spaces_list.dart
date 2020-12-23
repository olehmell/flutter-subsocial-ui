import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/bloc/spaces/space_bloc.dart';
import 'package:flutter_infinite_list/widgets/widgets.dart';

class SpacesList extends StatefulWidget {
  @override
  _SpacesListState createState() => _SpacesListState();
}

class _SpacesListState extends State<SpacesList> {
  final _scrollController = ScrollController();
  SpaceBloc _spaceBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _spaceBloc = BlocProvider.of<SpaceBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceBloc, SpaceState>(
      builder: (context, state) {
        switch (state.status) {
          case SpaceStatus.failure:
            return const Center(child: Text('failed to fetch spaces'));
          case SpaceStatus.success:
            if (state.spaces.isEmpty) {
              return const Center(child: Text('no spaces'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.spaces.length
                    ? BottomLoader()
                    : SpaceListItem(space: state.spaces[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.spaces.length
                  : state.spaces.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      _spaceBloc.add(SpaceFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

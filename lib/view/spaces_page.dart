import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/bloc/spaces/space_bloc.dart';

import 'spaces_list.dart';

class SpacesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spaces')),
      body: BlocProvider(
        create: (_) => SpaceBloc()..add(SpaceFetched()),
        child: SpacesList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/models/space.dart';

class SpaceListItem extends StatelessWidget {
  const SpaceListItem({Key key, @required this.space}) : super(key: key);

  final Space space;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${space.id.toString()}', style: textTheme.caption),
      title: Text(space.handle ?? space.id.toString()),
      isThreeLine: true,
      subtitle: Text(space.contentId),
      dense: true,
    );
  }
}

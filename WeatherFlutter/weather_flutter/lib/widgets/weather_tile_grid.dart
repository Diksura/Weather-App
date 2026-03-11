import 'package:flutter/material.dart';

class WeatherTileGrid extends StatelessWidget {

  final List<Widget> delegateChildren;

  const WeatherTileGrid({
    super.key,
    required this.delegateChildren
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        delegate: SliverChildListDelegate(
          delegateChildren
        ),

      ),
    );
  }
}

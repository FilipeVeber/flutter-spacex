import 'package:flutter/material.dart';
import 'package:flutter_spacex/app/modules/rockets/entities/rocket.dart';
import 'package:flutter_spacex/app/modules/rockets/widgets/rocket_list_tile_widget.dart';

class RocketListWidget extends StatelessWidget {
  final List<Rocket> _rockets;

  const RocketListWidget(this._rockets);

  @override
  Widget build(BuildContext context) {
    if (_rockets.length > 0) {
      return _buildList();
    }

    return _buildEmptyLayout();
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _rockets.length,
      itemBuilder: (_, int index) {
        return RocketListTileWidget(_rockets[index]);
      },
    );
  }

  Widget _buildEmptyLayout() {
    return Center(
      child: Text("No rocket found"),
    );
  }
}

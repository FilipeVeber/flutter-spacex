import 'package:flutter/material.dart';
import 'package:flutter_spacex/app/modules/rockets/entities/rocket.dart';

class RocketListTileWidget extends StatelessWidget {
  final Rocket _rocket;

  const RocketListTileWidget(this._rocket);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: _buildTitle(),
        trailing: _buildTrailing(),
        onTap: () {},
      ),
    );
  }

  Widget _buildTitle() {
    return Text(_rocket.name);
  }

  Widget _buildTrailing() {
    var label = "Inactive";
    var labelColor = Colors.red[400];

    if (_rocket.isActive) {
      label = "Active";
      labelColor = Colors.green[400];
    }

    return Text(
      label,
      style: TextStyle(fontWeight: FontWeight.bold, color: labelColor),
    );
  }
}

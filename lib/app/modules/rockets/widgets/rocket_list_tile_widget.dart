import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/base_widgets/base_image_from_network_widget.dart';
import 'package:flutter_spacex/app/modules/rockets/entities/rocket.dart';

class RocketListTileWidget extends StatelessWidget {
  final Rocket _rocket;

  const RocketListTileWidget(this._rocket);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: _buildTitle(),
          // leading: _buildLeading(),
          trailing: _buildTrailing(),
          onTap: () {
            Modular.link
                .pushNamed("/rocket/:id", arguments: {"id": _rocket.id});
          },
        ),
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

  Widget _buildLeading() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: BaseImageFromNetworkWidget(_rocket.images.first));
  }
}

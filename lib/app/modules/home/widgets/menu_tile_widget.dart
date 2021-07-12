import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spacex/app/modules/home/dtos/menu_tile_dto.dart';

class MenuTileWidget extends StatelessWidget {
  final MenuItemDto _menuItem;

  const MenuTileWidget(this._menuItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: _buildBorder(),
      color: this._menuItem.color[300],
      child: InkWell(
        onTap: this._menuItem.onTap,
        child: Center(
          child: _buildText(),
        ),
      ),
    );
  }

  Border _buildBorder() {
    return Border.all(
      color: this._menuItem.color[700],
      width: 2,
    );
  }

  Widget _buildText() {
    return Text(
      this._menuItem.label,
      style: TextStyle(
          color: this._menuItem.color[900], fontWeight: FontWeight.bold),
    );
  }
}

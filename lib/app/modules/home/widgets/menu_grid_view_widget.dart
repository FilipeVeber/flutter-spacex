import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/modules/home/dtos/menu_tile_dto.dart';
import 'package:flutter_spacex/app/modules/home/widgets/menu_tile_widget.dart';

class MenuGridViewWidget extends StatelessWidget {
  List<MenuItemDto> _menuItems = [
    new MenuItemDto("Rockets", Colors.green, () {
      Modular.to.pushNamed("/rockets");
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _menuItems.length,
      itemBuilder: (context, index) {
        return MenuTileWidget(_menuItems[index]);
      },
    ));
  }
}

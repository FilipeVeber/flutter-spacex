import 'package:flutter/material.dart';

class MenuItemDto {
  final String label;
  final MaterialColor color;
  final Function onTap;

  MenuItemDto(this.label, this.color, this.onTap);
}

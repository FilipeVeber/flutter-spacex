import 'package:flutter/material.dart';
import 'package:flutter_spacex/app/modules/home/widgets/menu_grid_view_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space X"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return MenuGridViewWidget();
  }
}

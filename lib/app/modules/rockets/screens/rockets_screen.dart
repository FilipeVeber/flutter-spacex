import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/base_widgets/base_loading_widget.dart';
import 'package:flutter_spacex/app/modules/rockets/states/rocket_state.dart';
import 'package:flutter_spacex/app/modules/rockets/stores/rocket_store.dart';
import 'package:flutter_spacex/app/modules/rockets/widgets/rocket_list_widget.dart';
import 'package:flutter_spacex/app/modules/rockets/widgets/search_rocket_error_widget.dart';

class RocketsScreen extends StatelessWidget {
  final _store = Modular.get<RocketStore>();

  @override
  Widget build(BuildContext context) {
    _store.getRockets();

    return Scaffold(
      appBar: AppBar(
        title: Text("Rockets"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (_) {
        var state = _store.searchRocketState;

        if (state is SearchRocketErrorState) {
          return SearchRocketErrorWidget(state.error);
        }

        if (state is SearchRocketLoadingState) {
          return BaseLoadingWidget();
        }

        if (state is SearchRocketSuccessState) {
          return RocketListWidget(state.rockets);
        }

        return Container();
      },
    );
  }
}

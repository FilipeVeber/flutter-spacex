import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spacex/app/base_widgets/base_loading_widget.dart';
import 'package:flutter_spacex/app/modules/rockets/states/search_rocket_state.dart';
import 'package:flutter_spacex/app/modules/rockets/stores/rocket_details_store.dart';
import 'package:flutter_spacex/app/modules/rockets/widgets/rocket_details_body_widget.dart';
import 'package:flutter_spacex/app/modules/rockets/widgets/search_rocket_error_widget.dart';

class RocketDetailsScreen extends StatelessWidget {
  final _store = Modular.get<RocketDetailsStore>();

  final String _id;

  RocketDetailsScreen(this._id);

  @override
  Widget build(BuildContext context) {
    _store.getRocket(_id);

    return Scaffold(
      appBar: AppBar(title: _buildAppBarTitle()),
      body: _buildBody(),
    );
  }

  Widget _buildAppBarTitle() {
    return Observer(builder: (context) {
      var state = _store.state;

      if (state is SearchRocketSuccessState) {
        return Text(state.rocket.name);
      }

      return Container();
    });
  }

  Widget _buildBody() {
    return Observer(
      builder: (context) {
        var state = _store.state;

        if (state is SearchRocketLoadingState) {
          return BaseLoadingWidget();
        }

        if (state is SearchRocketErrorState) {
          return SearchRocketErrorWidget(state.error);
        }

        if (state is SearchRocketSuccessState) {
          return RocketDetailsBodyWidget(state.rocket);
        }

        return Container();
      },
    );
  }
}

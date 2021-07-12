import 'package:flutter/material.dart';
import 'package:flutter_spacex/app/modules/rockets/errors/rocket_errors.dart';

class SearchRocketErrorWidget extends StatelessWidget {
  final SearchRocketError error;

  const SearchRocketErrorWidget(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        error.message,
        textAlign: TextAlign.center,
      ),
    ));
  }
}

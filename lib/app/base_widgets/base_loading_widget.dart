import 'package:flutter/material.dart';

class BaseLoadingWidget extends StatelessWidget {
  final String message;

  const BaseLoadingWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(child: CircularProgressIndicator()),
        SizedBox(
          height: 20,
        ),
        Center(child: _buildMessage()),
      ],
    );
  }

  Widget _buildMessage() {
    if (message != null && message.isNotEmpty) {
      return Text(
        message,
        style: TextStyle(fontSize: 15),
      );
    }

    return Container();
  }
}

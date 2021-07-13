import 'package:flutter/material.dart';

class BaseImageFromNetworkWidget extends StatelessWidget {
  final String _url;

  const BaseImageFromNetworkWidget(this._url);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _url,
      fit: BoxFit.cover,
      height: 50,
      width: 50,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }

        return AnimatedOpacity(
          child: child,
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }
}

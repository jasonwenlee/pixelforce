import 'package:flutter/material.dart';

/// Loads an image from a network request.
class ImageLoader extends StatelessWidget {
  /// A url to load image from.
  final String url;

  const ImageLoader({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url, // Replace with your image URL or asset
      width: 150,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

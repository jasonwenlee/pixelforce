import 'package:flutter/material.dart';

/// Section header with a title and optional trailing button.
class SectionHeader extends StatelessWidget {
  /// Title of section.
  final String title;

  /// Optional call back for trailing button. If provided, provide a [buttonText]
  /// to see see the button.
  final VoidCallback? onTap;

  /// Optional text to display on the trailing button.
  final String? buttonText;

  const SectionHeader({
    super.key,
    required this.title,
    this.onTap,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap == null
              ? const SizedBox.shrink()
              : GestureDetector(
                  onTap: onTap,
                  child: Text(
                    buttonText ?? '',
                    style: const TextStyle(color: Colors.deepPurpleAccent),
                  )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A custom search bar with optional trailing and leading icon.
class CustomSearchBar extends StatelessWidget {
  /// An optional leading icon.
  final Icon? leadingIcon;

  /// An optional trailing icon.
  final Icon? trailingIcon;

  const CustomSearchBar({
    super.key,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.shade300,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search address, city, location',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
          border: InputBorder.none,
          prefixIcon: leadingIcon,
          suffixIcon: trailingIcon,
        ),
      ),
    );
  }
}

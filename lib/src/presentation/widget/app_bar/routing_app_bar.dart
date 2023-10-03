

import 'package:flutter/material.dart';

import 'app_bar.dart';

class RoutingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoutingAppBar({
    required this.title,
    Key? key
  }): preferredSize = const Size.fromHeight(42), super(key: key);

  @override
  final Size preferredSize;

  final String title;

  @override
  Widget build(BuildContext context) {
    return CommonAppBar(
      title: title,
      centerTitle: true,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }
}

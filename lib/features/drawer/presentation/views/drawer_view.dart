import 'package:flutter/material.dart';

import 'widgets/drawer_view_body.dart';


class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: DrawerViewBody(),
    );
  }
}

import 'package:flutter/material.dart';

import 'widgets/compalints_view_body.dart';

class CompalintsView extends StatelessWidget {
  const CompalintsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: CompalintsViewBody(),
    );
  }
}

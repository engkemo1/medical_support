import 'package:flutter/material.dart';
import 'widgets/new_product_view_body.dart';

class NewProductView extends StatelessWidget {
  const NewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
        textDirection: TextDirection.rtl, child: NewProductViewBody());
  }
}

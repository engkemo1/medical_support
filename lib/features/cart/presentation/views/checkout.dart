import 'package:flutter/material.dart';
import 'package:medical_support/features/cart/presentation/views/widgets/check_out_body.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: CheckOutBody(),
    );
  }
}

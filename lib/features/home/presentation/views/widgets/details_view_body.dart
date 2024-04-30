import 'package:flutter/material.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "التفاصيل")
        ],
      ),
    );
  }
}

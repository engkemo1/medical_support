
import 'package:flutter/material.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';

class MedicinesViewBody extends StatelessWidget {
  const MedicinesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: "الجهاز الهضمي"),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const Card(
                  color: Colors.red,
                  child: Row(
                    children: [
                      Text("data"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

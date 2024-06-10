import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_cubit.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_state.dart';
import 'custom_card.dart';

class GridViewBuilder extends StatelessWidget {
   GridViewBuilder({
    required this.data,
    super.key,
  });
var data ;
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          clipBehavior: Clip.none,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return  CustomCard(categoryModel: data[index],);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 30,
          ),
        );


  }
}

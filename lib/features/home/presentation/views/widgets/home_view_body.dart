import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/core/widgets/custom_text_field.dart';
import '../../../../../view_model/cubit/category_cubit/category_cubit.dart';
import '../../../../../view_model/cubit/category_cubit/category_state.dart';
import 'grid_view_builder.dart';

class HomeViewBody extends StatefulWidget {
  HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CategoryCubit, CategoryMainState>(
          listener: (context, state) async {
        if (state is GetCategoryLoadingState) {
          SmartDialog.showLoading();
          await Future.delayed(const Duration(seconds: 2));
          SmartDialog.dismiss();
        }
      }, builder: (context, state) {
        var data = CategoryCubit.get(context).listCategoryModel;
        return Stack(children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 8.sp, right: 8.0.sp, top: 85.sp),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    onChanged: (value) {
                      context.read<CategoryCubit>().searchCategory(value);
                      setState(() {

                      });

                    },
                    keyboardType: TextInputType.text,
                    labelText: "البحث",
                    controller: search,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GridViewBuilder(
                    data: search.text.isEmpty
                        ? data
                        : CategoryCubit.get(context).categoryModelSearch,
                  ),
                ],
              ),
            ),
          ),
          const Column(
            children: [
              CustomAppBar(title: "الاقسام"),
            ],
          ),
        ]);
      }),
    );
  }
}

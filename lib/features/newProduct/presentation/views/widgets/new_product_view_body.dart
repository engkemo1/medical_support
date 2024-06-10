import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_cubit.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_state.dart';

import '../../../../home/presentation/views/details_view.dart';

class NewProductViewBody extends StatelessWidget {
  const NewProductViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: "المنتجات الجديدة",
          ),
          Expanded(
            child: BlocConsumer<CategoryCubit, CategoryMainState>(
              builder: (context, cubit) {
                var data= CategoryCubit.get(context).productModelList;
                var list=data.getRange(0, 5).toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ListTile(
                            onTap: () {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => DetailsView(
                                            productModel: list[index],
                                          )));

                            },
                            contentPadding: const EdgeInsets.all(16.0),
                            leading: Image.network(
                              list[index].image.toString(),
                              errorBuilder: (context , o , e)=>Image.asset(
                                Assets.logo,
                                width: 100,
                                height: 100,
                              ),
                              width: 100,
                              height: 100,
                            ),
                            title:  Text(
                              list[index].name!,
                              style: Styles.textStyle28,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              listener: (BuildContext context, CategoryMainState state) async {
                if (state is GetSubCategoryLoadingState) {
                  SmartDialog.showLoading();
                  await Future.delayed(const Duration(seconds: 2));
                  SmartDialog.dismiss();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

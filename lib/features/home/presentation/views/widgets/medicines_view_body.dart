import 'package:flutter/material.dart';
import 'package:medical_support/core/utils/app_router.dart';
import 'package:medical_support/core/utils/assets.dart';
import 'package:medical_support/core/utils/styles.dart';
import 'package:medical_support/core/widgets/custom_app_bar.dart';
import 'package:medical_support/features/home/presentation/views/details_view.dart';

import '../../../../../model/product_model.dart';

class MedicinesViewBody extends StatelessWidget {
  MedicinesViewBody(
      {super.key, required this.listProducts, required this.title});

  List<ProductModel> listProducts = [];
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(title: title,isBack: true,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: listProducts.length,
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailsView(
                                        productModel: listProducts[index],
                                      )));
                        },
                        child: ListTile(
                          title: Text(
                            listProducts[index].name.toString(),
                            style: Styles.textStyle28,
                          ),
                          subtitle: Text(
                            listProducts[index].type.toString(),
                            style: Styles.textStyle14,
                          ),
                          trailing: Image.network(
                            listProducts[index].image.toString(),
                            errorBuilder: (context , o , e)=>Image.asset(
                              Assets.logo,
                              width: 100,
                              height: 100,
                            ),
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
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

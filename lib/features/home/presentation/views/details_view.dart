import 'package:flutter/material.dart';
import 'package:medical_support/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:medical_support/model/product_model.dart';

class DetailsView extends StatelessWidget {
   DetailsView({super.key,required this.productModel});
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: DetailsViewBody(productModel: productModel,),
    );
  }
}

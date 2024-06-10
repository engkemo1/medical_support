import 'package:flutter/material.dart';

import '../../../../model/product_model.dart';
import 'widgets/medicines_view_body.dart';

class MedicinesView extends StatelessWidget {
   MedicinesView({super.key,required this.products,required this.title});
List<ProductModel> products=[];
String title;
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: MedicinesViewBody(listProducts: products,title:title ,),
    );
  }
}

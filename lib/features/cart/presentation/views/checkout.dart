import 'package:flutter/material.dart';
import 'package:medical_support/features/cart/presentation/views/widgets/check_out_body.dart';

class CheckOut extends StatelessWidget {
   CheckOut({super.key,this.total,this.products});
  var total;
  var products;

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: CheckOutBody(total:total,products: products,),
    );
  }
}

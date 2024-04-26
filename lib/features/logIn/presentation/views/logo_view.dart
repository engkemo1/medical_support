import 'package:flutter/material.dart';
import 'package:medical_support/features/logIn/presentation/views/widgets/logo_view_body.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body:LogoViewBody(),
      ),
    );
  }
}

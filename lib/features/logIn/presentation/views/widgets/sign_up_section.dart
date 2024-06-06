import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_support/core/widgets/custom_text_field.dart';

class SignUpSection extends StatefulWidget {
  const SignUpSection({super.key});

  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  String? selectedGovernorate = 'سوهاج';
  final List<String> governorates = [
    'القاهرة',
    'الإسكندرية',
    'بورسعيد',
    'السويس',
    'دمياط',
    'الدقهلية',
    'الشرقية',
    'القليوبية',
    'كفر الشيخ',
    'الغربية',
    'المنوفية',
    'البحيرة',
    'الإسماعيلية',
    'الجيزة',
    ' بني سويف',
    'الفيوم',
    'المنيا',
    'أسيوط',
    'سوهاج',
    'قنا',
    'الأقصر',
    ' أسوان',
    'البحر الأحمر',
    'الوادي الجديد',
    'مطروح',
    'شمال سيناء',
    'جنوب سيناء',
    // Add the rest of the governorates here
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomTextField(
            keyboardType: TextInputType.text,
            prefixIcon: Icon(
              Icons.person_outline,
            ),
            labelText: 'الاسم',
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomTextField(
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icon(
              Icons.email_outlined,
            ),
            labelText: 'البريد الالكترونى',
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomTextField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icon(
              Icons.key_outlined,
            ),
            labelText: 'كلمة السر ',
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomTextField(
            keyboardType: TextInputType.phone,
            prefixIcon: Icon(
              Icons.phone_outlined,
            ),
            labelText: 'الهاتف',
          ),
          SizedBox(
            height: 10.h,
          ),
          Card(
            shadowColor: Colors.grey,
            elevation: 5,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: DropdownButton<String>(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                underline: Container(
                  height: 2,
                  color: Colors.transparent,
                ),
                value: selectedGovernorate,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGovernorate = newValue;
                  });
                },
                items: governorates.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),

              ),
            ),
          )
        ],
      ),
    );
  }
}

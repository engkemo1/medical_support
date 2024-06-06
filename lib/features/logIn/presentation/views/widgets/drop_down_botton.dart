import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
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
    return Card(
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
    );
  }
}

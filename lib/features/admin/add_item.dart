import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_support/model/category_model.dart';
import 'package:medical_support/view_model/cubit/admin_cubit/admin_cubit.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key, required this.categoryModel});

  final List<CategoryModel> categoryModel;

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  ImagePicker picker = ImagePicker();
  XFile? image;

  Future<void> _pickImage() async {
    final XFile? selectedImage = await picker.pickImage(
        source: ImageSource.gallery);
    if (selectedImage != null) {
      setState(() {
        image = selectedImage;
      });
    }
  }

  TextEditingController imageController = TextEditingController();
  List<String>categories = [];
  String _name = '';
  String _imageUrl = '';
  String _categoryId = '';
  String _price = '';
  String _type = '';
  String _description = '';
  var category;
  var categoryId;

  @override
  void initState() {
    widget.categoryModel.forEach((e) {
      categories.add(e.name.toString());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Product',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 50,),

                Icon(Icons.add_shopping_cart_rounded, size: 100,
                  color: Colors.black,),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الاسم',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ), focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the item name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(height: 10,),


                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'السعر',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the price';
                    }
                    return null;
                  },
                  onSaved: (value) => _price = value!,
                ),
                const SizedBox(height: 10,),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'النوع',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the type';
                    }
                    return null;
                  },
                  onSaved: (value) => _type = value!,
                ),
                const SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButton<String>(
                      hint: const Text("الاصناف", textAlign: TextAlign.center,),
                      isExpanded: true,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      underline: Container(
                        height: 2,
                        color: Colors.transparent,
                      ),
                      value: category,
                      onChanged: (String? newValue) {
                        var item = widget.categoryModel.firstWhere((
                            val) => newValue == val.name.toString());
                        setState(() {
                          category = newValue;
                          categoryId = item.id;
                        });
                      },
                      items: categories.map<DropdownMenuItem<String>>((
                          String value) {
                        return DropdownMenuItem<String>(
                          value: value, alignment: Alignment.center,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'الوصف',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) => _description = value!,
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    _pickImage();
                    imageController.text =
                    image != null ? image!.path.toString():
                    'No image selected.';
                    setState(() {

                    });

                  },
                  child: TextFormField(

                    controller: imageController,

                    decoration: InputDecoration(
                      labelText: 'اضف صوره',
                      suffixIcon: Icon(Icons.camera),

                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabled: false,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: Colors.black)),
                    ),

                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter the image URL';
                      }
                      return null;
                    },
                    onSaved: (value) => _imageUrl = value!,
                  ),
                ),
                const SizedBox(height: 30,),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 70),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                              Colors.black)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          AdminCubit().addItem(
                              _name, categoryId.toString(), image!.path, _price,
                              _type, _description);
                          // Process data and add the item
                        }
                      },
                      child: Text('Submit', style: TextStyle(color: Colors
                          .white),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

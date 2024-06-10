import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_support/core/api/end_point.dart';
import 'package:medical_support/core/database/cache/cache_helper.dart';
import 'package:medical_support/model/category_model.dart';
import 'package:medical_support/model/product_model.dart';
import 'package:medical_support/view_model/cubit/category_cubit/category_state.dart';
import '../../database/network/dio_helper.dart';

class CategoryCubit extends Cubit<CategoryMainState> {
  CategoryCubit() : super(CategoryMainInitialState());

  static CategoryCubit get(context) => BlocProvider.of(context);
  List<CategoryModel> listCategoryModel = [];
  Map<int, ProductModel> cart = {};
  List<ProductModel> productModelList = [];
  var price = 0.0;
  List<CategoryModel> categoryModelSearch = [];

  ///////////////////////////////////get category//////////////////////////////////////////

  Future getCategory() async {
    emit(GetCategoryLoadingState());

    try {
      await DioHelper.getData(
              url: "${EndPoint.baseUrl}${EndPoint.categories}",
              token: CacheHelper().getData(key: "token"))
          .then((value) {
        print(value.data);

        listCategoryModel =
            (value.data as List).map((e) => CategoryModel.fromJson(e)).toList();

        print("sucessss");
        emit(GetCategorySuccessState());
      });
    } on DioError catch (e) {
      print(e.response);
      emit(GetCategoryErrorState(e));
    }
    return listCategoryModel;
  }

  ///////////////////////////////////search for category//////////////////////////////////////////

  void searchCategory(String name) {
    name = name.toLowerCase();
    categoryModelSearch = listCategoryModel.where((search) {
      var searchTitle = search.name!.toString().toLowerCase();
      print(searchTitle.contains(name));
      return searchTitle.contains(name);
    }).toList();
print(categoryModelSearch);
    if (name == "") {
      categoryModelSearch.clear();
    } else {}
    emit(state);

  }


  ///////////////////////////////////getProducts//////////////////////////////////////////

  Future<List<ProductModel>> getSubCategory() async {
    emit(GetSubCategoryLoadingState());

    try {
      await DioHelper.getData(
              url: "${EndPoint.baseUrl}${EndPoint.products}",
              token: CacheHelper().getData(key: "token"))
          .then((value) {
        print(value.data);

        productModelList =
            (value.data as List).map((e) => ProductModel.fromJson(e)).toList();

        print("sucessss");
        emit(GetSubCategorySuccessState());
      });
    } on DioError catch (e) {
      print(e.response);
      emit(GetSubCategoryErrorState(e));
    }
    return productModelList;
  }
}

abstract class CategoryMainState {}

class  CategoryMainInitialState extends CategoryMainState{}
class GetCategoryLoadingState extends CategoryMainState{}
class GetCategorySuccessState extends CategoryMainState{}

class GetCategoryErrorState extends CategoryMainState{
  final  error;

  GetCategoryErrorState(this.error);
}
class AddCategoryLoadingState extends CategoryMainState{}
class AddCategorySuccessState extends CategoryMainState{}

class AddCategoryErrorState extends CategoryMainState{
  final  error;

  AddCategoryErrorState(this.error);
}

class GetSubCategoryLoadingState extends CategoryMainState{}
class GetSubCategorySuccessState extends CategoryMainState{}

class GetSubCategoryErrorState extends CategoryMainState{
  final  error;

  GetSubCategoryErrorState(this.error);
}
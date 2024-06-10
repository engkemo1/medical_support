abstract class OrderMainState {}

class  OrderMainInitialState extends OrderMainState{}
class OrderLoadingState extends OrderMainState{}
class OrderSuccessState extends OrderMainState{}

class OrderErrorState extends OrderMainState{
  final  error;

  OrderErrorState(this.error);
}
class GetOrderLoadingState extends OrderMainState{}
class  GetOrderSuccessState extends OrderMainState{}

class  GetOrderErrorState extends OrderMainState{
  final  error;

  GetOrderErrorState(this.error);
}

class GetOrderAdminLoadingState extends OrderMainState{}
class  GetOrderAdminSuccessState extends OrderMainState{}

class  GetOrderAdminErrorState extends OrderMainState{
  final  error;

  GetOrderAdminErrorState(this.error);
}

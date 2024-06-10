abstract class AdminMainState {}

class  AdminMainInitialState extends AdminMainState{}
class GetChatsLoadingState extends AdminMainState{}
class GetChatsSuccessState extends AdminMainState{}

class GetChatsErrorState extends AdminMainState{
  final  error;

  GetChatsErrorState(this.error);
}


abstract class CompliantMainState {}

class  CompliantMainInitialState extends CompliantMainState{}
class CompliantLoadingState extends CompliantMainState{}
class CompliantSuccessState extends CompliantMainState{}

class CompliantErrorState extends CompliantMainState{
  final  error;

  CompliantErrorState(this.error);
}

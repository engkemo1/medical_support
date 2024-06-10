abstract class DoctorMainState {}

class  DoctorMainInitialState extends DoctorMainState{}
class DoctorLoadingState extends DoctorMainState{}
class DoctorSuccessState extends DoctorMainState{}

class DoctorErrorState extends DoctorMainState{
  final  error;

  DoctorErrorState(this.error);
}

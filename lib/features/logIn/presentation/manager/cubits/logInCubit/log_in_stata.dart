
class LogInState {}

final class LogInitial extends LogInState {}

final class LogInSuccess extends LogInState {}

final class LogInFailed extends LogInState{
  final String errorMessage;

  LogInFailed({required this.errorMessage});
}

final class LogInLoading extends LogInState {}

// final class UploadImageSuccess extends UserState {}

// final class SingUpSuccess extends UserState {
//   final String message;
//
//   SingUpSuccess(this.message);
// }

// final class SingUpFailed extends UserState {
//   final String errorMessage;
//
//   SingUpFailed({required this.errorMessage});
// }

// final class SingUpLoading extends UserState {}
//
// final class UserSuccess  extends UserState {
//   final UserModel user;
//
//   UserSuccess(this.user);
// }

// final class UserFailed extends UserState {
//   final String errorMessage;
//
//   UserFailed({required this.errorMessage});
// }
//
// final class UserLoading extends UserState {}

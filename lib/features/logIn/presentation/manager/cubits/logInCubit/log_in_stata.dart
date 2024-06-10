
class LogInState {}

final class LogInitial extends LogInState {}

final class LogInSuccess extends LogInState {}

final class LogInFailed extends LogInState{
  final String errorMessage;

  LogInFailed({required this.errorMessage});
}

final class LogInLoading extends LogInState {}

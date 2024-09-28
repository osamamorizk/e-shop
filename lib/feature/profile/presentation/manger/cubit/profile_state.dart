part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class SignOutLoading extends ProfileState {}

final class SignOutSuccess extends ProfileState {}

final class SignOutFailure extends ProfileState {
  final String errorMessage;

  SignOutFailure({required this.errorMessage});
}

final class GetProfileSuccess extends ProfileState {
  final String email;

  GetProfileSuccess({required this.email});
}

final class GetProfileFailure extends ProfileState {
  final String errorMessage;

  GetProfileFailure({required this.errorMessage});
}

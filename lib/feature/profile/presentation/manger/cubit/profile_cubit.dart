import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:shop_app/feature/profile/data/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  final ProfileRepo profileRepo;

  Future<void> signOut() async {
    emit(SignOutLoading());
    var result = await profileRepo.signout();
    result.fold(
      (failure) {
        emit(SignOutFailure(errorMessage: failure.errorMessage));
      },
      (signout) {
        emit(SignOutSuccess());
      },
    );
  }

  Future<void> getProfile() async {
    var result = await profileRepo.getProfile();
    result.fold((failure) {
      emit(GetProfileFailure(errorMessage: failure.errorMessage));
    }, (profile) {
      emit(GetProfileSuccess(email: profile!));
    });
  }
}

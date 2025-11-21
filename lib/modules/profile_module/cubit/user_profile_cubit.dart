import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/modules/profile_module/services/profile_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/modules/profile_module/models/user_profile_model.dart';

part 'user_profile_cubit.freezed.dart';
part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(const UserProfileState.initial());

  Future<void> getUserProfile() async {
    emit(const UserProfileState.userProfileLoading());
    try {
      final int userId = await AuthStorageFunctions.getUserId();

      final UserProfileModel userProfile =
          await ProfileServices.getUserProfileDetails(userId: userId);

      emit(UserProfileState.userProfileSuccess(userProfile));
    } catch (e) {
      emit(UserProfileState.userProfileError(e.toString()));
    }
  }
}

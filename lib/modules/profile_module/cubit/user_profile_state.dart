part of 'user_profile_cubit.dart';

@freezed
sealed class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = UserProfileInitial;
  const factory UserProfileState.userProfileLoading() = UserProfileLoading;
  const factory UserProfileState.userProfileError(String errorMessage) =
      UserProfileError;
  const factory UserProfileState.userProfileSuccess(
    UserProfileModel userProfile,
  ) = UserProfileSuccess;
}

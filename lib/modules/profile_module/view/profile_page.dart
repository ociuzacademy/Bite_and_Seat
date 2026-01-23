// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/modules/profile_module/utils/profile_helper.dart';
import 'package:bite_and_seat/modules/profile_module/widgets/profile_action_button.dart';
import 'package:bite_and_seat/widgets/custom_error_widget.dart';
import 'package:bite_and_seat/widgets/loaders/custom_loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/profile_module/widgets/info_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const ProfilePage());

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileHelper _profileHelper;
  @override
  void initState() {
    super.initState();
    _profileHelper = ProfileHelper(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileHelper.userProfileInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppPalette.firstColor,
        iconTheme: const IconThemeData(color: AppPalette.secondColor),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppPalette.secondColor,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppPalette.secondColor),
            onPressed: () {
              // Navigate to edit profile page
            },
          ),
        ],
      ),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          switch (state) {
            case UserProfileInitial _:
            case UserProfileLoading _:
              return const CustomLoadingWidget(
                message: 'Loading user profile data...',
              );

            case UserProfileError(:final errorMessage):
              return CustomErrorWidget(
                onRetry: _profileHelper.userProfileInit,
                errorMessage: errorMessage,
              );
            case UserProfileSuccess(:final userProfile):
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Avatar with Cached Network Image
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppPalette.firstColor,
                          width: 3,
                        ),
                      ),
                      child: ClipOval(
                        child: userProfile.profilePhoto.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl:
                                    '${AppUrls.baseUrl}/${userProfile.profilePhoto}',
                                placeholder: (context, url) => Container(
                                  color: AppPalette.greyColor,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: AppPalette.firstColor,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: AppPalette.greyColor,
                                  child: const Icon(
                                    Icons.person,
                                    size: 40,
                                    color: AppPalette.whiteColor,
                                  ),
                                ),
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              )
                            : Container(
                                color: AppPalette.greyColor,
                                child: const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: AppPalette.whiteColor,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // User Name
                    Text(
                      userProfile.username,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppPalette.blackColor,
                          ),
                    ),
                    const SizedBox(height: 8),

                    // User Role with colored badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppPalette.firstColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        userProfile.userType.label.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppPalette.firstColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Information Card
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // Department
                            InfoRow(
                              icon: Icons.school,
                              label: 'Department',
                              value: userProfile.department,
                            ),
                            const SizedBox(height: 16),

                            // ID Number
                            InfoRow(
                              icon: Icons.badge,
                              label: 'ID Number',
                              value: userProfile.id.toString(),
                            ),
                            const SizedBox(height: 16),

                            // Batch
                            userProfile.batchName != null
                                ? InfoRow(
                                    icon: Icons.group,
                                    label: 'Batch',
                                    value: userProfile.batchName!,
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Additional Actions
                    ProfileActionButton(
                      icon: Icons.logout,
                      text: 'Logout',
                      onPressed: () {
                        // Handle logout
                        _profileHelper.showLogoutConfirmation();
                      },
                      isLogout: true,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

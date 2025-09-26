// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/profile_module/utils/profile_helper.dart';
import 'package:bite_and_seat/modules/profile_module/widgets/profile_action_button.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/profile_module/widgets/info_row.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static route() =>
      MaterialPageRoute(builder: (context) => const ProfilePage());

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileHelper _profileHelper;
  @override
  void initState() {
    _profileHelper = ProfileHelper(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Sample user data - in a real app, this would come from authentication
    final user = {
      'name': 'Dr. Sarah Johnson',
      'email': 'sarah.johnson@university.edu',
      'role': 'Professor',
      'department': 'Computer Science',
      'id': 'EMP-10245',
      'phone': '+1 (555) 123-4567',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppPalette.firstColor,
        iconTheme: IconThemeData(color: AppPalette.secondColor),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppPalette.secondColor,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: AppPalette.secondColor),
            onPressed: () {
              // Navigate to edit profile page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppPalette.firstColor, width: 3),
              ),
              child: CircleAvatar(
                radius: 56,
                backgroundColor: AppPalette.greyColor,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: AppPalette.whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // User Name
            Text(
              user['name']!,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppPalette.blackColor,
              ),
            ),
            const SizedBox(height: 8),

            // User Role with colored badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: AppPalette.firstColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                user['role']!,
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
                      value: user['department']!,
                    ),
                    const SizedBox(height: 16),

                    // ID Number
                    InfoRow(
                      icon: Icons.badge,
                      label: 'ID Number',
                      value: user['id']!,
                    ),
                    const SizedBox(height: 16),

                    // Email
                    InfoRow(
                      icon: Icons.email,
                      label: 'Email',
                      value: user['email']!,
                    ),
                    const SizedBox(height: 16),

                    // Phone
                    InfoRow(
                      icon: Icons.phone,
                      label: 'Phone',
                      value: user['phone']!,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Additional Actions
            Column(
              children: [
                ProfileActionButton(
                  icon: Icons.history,
                  text: 'Reservation History',
                  onPressed: () {
                    // Navigate to reservation history
                  },
                ),
                const SizedBox(height: 12),
                ProfileActionButton(
                  icon: Icons.settings,
                  text: 'App Settings',
                  onPressed: () {
                    // Navigate to settings
                  },
                ),
                const SizedBox(height: 12),
                ProfileActionButton(
                  icon: Icons.help,
                  text: 'Help & Support',
                  onPressed: () {
                    // Navigate to help
                  },
                ),
                const SizedBox(height: 12),
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
          ],
        ),
      ),
    );
  }
}

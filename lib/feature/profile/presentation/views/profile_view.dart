import 'package:flutter/material.dart';
import 'package:shop_app/feature/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: .5,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.notifications,
              size: 30,
            ),
          )
        ],
        title: const Text(
          'Account',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      body: const ProfileViewBody(),
    );
  }
}

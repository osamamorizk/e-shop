import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/functions/dialog_fun.dart';
import 'package:shop_app/feature/profile/presentation/manger/cubit/profile_cubit.dart';

import 'package:shop_app/feature/profile/presentation/views/widgets/profile_element.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is GetProfileSuccess) {
                return EmailWidget(
                  state: state,
                );
              } else {
                return const Text("can't get email");
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileElement(
            icon: FontAwesomeIcons.cartShopping,
            title: 'Cart',
            onPressed: () {
              GoRouter.of(context).push(Routes.cartView);
            },
          ),
          const ProfileElement(
            title: 'Help Center',
            icon: FontAwesomeIcons.circleQuestion,
          ),
          const ProfileElement(
            icon: (FontAwesomeIcons.bell),
            title: 'Notification',
          ),
          const ProfileElement(
            icon: (FontAwesomeIcons.info),
            title: 'About Store',
          ),
          BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is SignOutSuccess) {
                GoRouter.of(context).go(Routes.loginView);
                Fluttertoast.showToast(
                    msg: "Sign out Successfuly",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            builder: (context, state) {
              return ProfileElement(
                icon: (FontAwesomeIcons.arrowRightFromBracket),
                title: 'Sign Out',
                onPressed: () {
                  showAlertDialog(context, () async {
                    GoRouter.of(context).pop();
                    BlocProvider.of<ProfileCubit>(context).signOut();
                  }, "Sign out", "Would you like to sign out?");
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    this.state,
  });

  final state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: .3),
      ),
      child: Center(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                size: 32,
                Icons.account_circle,
              ),
            ),
            Text(
              "  ${state.email}",
              style: const TextStyle(fontSize: 24, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

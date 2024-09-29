import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/core/Routing/routes.dart';
import 'package:shop_app/core/functions/dialog_fun.dart';
import 'package:shop_app/feature/profile/presentation/manger/cubit/profile_cubit.dart';
import 'package:shop_app/feature/profile/presentation/views/widgets/email_widget.dart';

import 'package:shop_app/feature/profile/presentation/views/widgets/profile_element.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ListView(
        children: [
          const SizedBox(
            height: 5,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                ProfileElement(
                  icon: (FontAwesomeIcons.solidHeart),
                  title: 'Favorites',
                  onPressed: () {
                    GoRouter.of(context).push(Routes.favoriteView);
                  },
                ),
                ProfileElement(
                  icon: FontAwesomeIcons.cartShopping,
                  title: 'Cart',
                  onPressed: () {
                    GoRouter.of(context).push(Routes.cartView);
                  },
                ),
                const ProfileElement(
                  icon: (FontAwesomeIcons.bell),
                  title: 'Notification',
                ),
                const ProfileElement(
                  title: 'Help Center',
                  icon: FontAwesomeIcons.circleQuestion,
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
          )
        ],
      ),
    );
  }
}

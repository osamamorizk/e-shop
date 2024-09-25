import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/feature/cart/presentation/views/cart_view.dart';
import 'package:shop_app/feature/favorite/presentation/views/favorite_view.dart';
import 'package:shop_app/feature/home/presentation/views/home_view.dart';

Color kPrimaryColor = Color(0xff21D4B4);
bool onboard = false;

List<BottomNavigationBarItem> bottomBarItems = const [
  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house), label: 'Home'),
  // BottomNavigationBarItem(
  //     icon: Icon(Icons.grid_view_sharp), label: 'Categories'),
  BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.solidHeart), label: 'Favorite'),
  BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.cartShopping), label: 'Cart'),
  BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.solidUser), label: 'Profile'),
];

List<Widget> screens = const [
  HomeView(),
  FavoriteView(),
  CartView(),
  CartView(),
  // CartView(),
];

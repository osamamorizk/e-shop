import 'package:flutter/material.dart';
import 'package:shop_app/core/helpers/consts.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Image.asset(height: 42, 'assets/images/quickmart1.5.png'),
      //   actions: const [
      //     Icon(
      //       weight: 50,
      //       size: 30,
      //       FontAwesomeIcons.magnifyingGlass,
      //     )
      //   ],
      // ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(size: 25),
          elevation: 10,
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xff21D4B4),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: bottomBarItems,
        ),
      ),
      body: screens.elementAt(currentIndex),
    );
  }
}

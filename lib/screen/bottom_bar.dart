import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_shop/screen/home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  static const List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    Text("Screen 2"),
    Text("Screen 3"),
    Text('Screen 4'),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color selectedColor = Color(0xff00b761);
    const Color unSelectedColor = Color(0xffB2B2B2);
    return Scaffold(
      body: Center(child: widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: BottomNavigationBar(
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/home.svg",
                colorFilter: ColorFilter.mode(
                    selectedIndex == 0 ? selectedColor : unSelectedColor,
                    BlendMode.srcIn),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/love.svg",
                colorFilter: ColorFilter.mode(
                    selectedIndex == 1 ? selectedColor : unSelectedColor,
                    BlendMode.srcIn),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/notification.svg",
                colorFilter: ColorFilter.mode(
                    selectedIndex == 2 ? selectedColor : unSelectedColor,
                    BlendMode.srcIn),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/person.svg",
                height: 20.0,
                colorFilter: ColorFilter.mode(
                    selectedIndex == 3 ? selectedColor : unSelectedColor,
                    BlendMode.srcIn),
              ),
              label: "",
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food/screens/favorite_screen.dart';
import 'package:food/screens/home_screen.dart';
import 'package:food/screens/profile_screen.dart';

class NavbarProvider with ChangeNotifier {
  List<NavbarDTO> items = [
    NavbarDTO(label: 'home', widget: const HomeScreen(), iconData: Icons.home),
    NavbarDTO(
        label: 'Favorites', widget: const FavoriteScreen(), iconData: Icons.favorite),
    NavbarDTO(
        label: 'Profile',
        widget: const ProfileScreen(),
        iconData: Icons.account_box_rounded),
  ];
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}

class NavbarDTO {
  Widget? widget;
  String? label;
  IconData? iconData;

  NavbarDTO({this.widget, this.label, this.iconData});
}

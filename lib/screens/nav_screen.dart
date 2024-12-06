import 'package:flutter/material.dart';
import 'package:food/provider/bottomnav_provider.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<NavbarProvider>(
      context,
    );

    return Scaffold(
      body: mp.items[mp.selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mp.selectedIndex,
        onTap: (i) {
          mp.selectedIndex = i;
        },
        items: mp.items
            .map(
              (e) => BottomNavigationBarItem(
                  icon: Icon(e.iconData), label: e.label),
            )
            .toList(),
      ),
    );
  }
}

// ignore_for_file: non_constant_identifier_names

import 'package:cooks_corner/pages/pages.dart';
import 'package:cooks_corner/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('Messages');

  final pages = const [HomePage(), SearchPage(), ChefPage(), ProfilePage()];

  void _onNavigationItemSelected(index) {
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          },
        ),
        bottomNavigationBar: _BottomNavigationBar(
          onItemSelected: _onNavigationItemSelected,
        ));
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 10,
            blurRadius: 50,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        color: (brightness == Brightness.light)
            ? const Color.fromARGB(0, 190, 108, 108)
            : null,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: SafeArea(
          top: false,
          bottom: true,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16.0, left: 8, right: 8, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavigationBarItem(
                  index: 0,
                  icon: Icons.home,
                  icon_outlined: Icons.home_outlined,
                  isSelected: (selectedIndex == 0),
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  index: 1,
                  icon: Icons.search,
                  icon_outlined: Icons.search_outlined,
                  isSelected: (selectedIndex == 1),
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  index: 2,
                  icon: Icons.kitchen,
                  icon_outlined: Icons.kitchen_outlined,
                  isSelected: (selectedIndex == 2),
                  onTap: handleItemSelected,
                ),
                _NavigationBarItem(
                  index: 3,
                  icon: Icons.person,
                  icon_outlined: Icons.person_outlined,
                  isSelected: (selectedIndex == 3),
                  onTap: handleItemSelected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem(
      {Key? key,
      required this.index,
      required this.icon,
      required this.icon_outlined,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  final int index;
  final IconData? icon;
  final IconData? icon_outlined;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        height: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? icon : icon_outlined,
              size: 24,
              color: isSelected ? AppColors.primary : null,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

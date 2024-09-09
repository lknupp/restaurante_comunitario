import 'package:flutter/material.dart';
import 'package:restaurante_comunitario/screens/home.dart';
import 'package:restaurante_comunitario/screens/restaurantes.dart';
import 'package:restaurante_comunitario/widgets/bottom_navigation_bar.dart';

enum Screen {
  home,
  meals,
}

const screenNames = {
  Screen.home: 'Informações',
  Screen.meals: 'Restaurantes',
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();
    var activePageTitle = screenNames[Screen.home];

    debugPrint('Selected page index: $_selectedPageIndex');
    if (_selectedPageIndex == 1) {
      activePage = const RestaurantesScreen();
      activePageTitle = screenNames[Screen.meals];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Center(
          child: Text(
            activePageTitle!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      // drawer: MainDrawer(
      //   onSelectedScreen: _setScreen,
      // ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBarWidget(
        onSelectPage: _selectPage,
      ),
    );
  }
}

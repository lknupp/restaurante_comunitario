import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key, required this.onSelectPage});

  final void Function(int) onSelectPage;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    widget.onSelectPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _selectPage,
      currentIndex: _selectedPageIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.set_meal),
          label: 'Info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Restaurantes',
        ),
      ],
    );
  }
}

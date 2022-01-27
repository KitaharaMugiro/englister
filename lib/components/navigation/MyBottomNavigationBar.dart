import 'package:flutter/material.dart';

class MyBottomNavigationBar extends BottomNavigationBar {
  MyBottomNavigationBar(int currentIndex, void Function(int) onTap, {Key? key})
      : super(
          key: key,
          currentIndex: currentIndex,
          onTap: onTap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Record',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.translate),
              label: 'Phrase',
            ),
          ],
        );
}

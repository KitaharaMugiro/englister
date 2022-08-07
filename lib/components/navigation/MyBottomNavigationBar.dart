import 'package:flutter/material.dart';

class MyBottomNavigationBar extends BottomNavigationBar {
  MyBottomNavigationBar(int currentIndex, void Function(int) onTap, {Key? key})
      : super(
          key: key,
          currentIndex: currentIndex,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'ホーム',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: '学習履歴',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.translate,
              ),
              label: 'フレーズ',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.note,
              ),
              label: '日記',
            ),
          ],
        );
}

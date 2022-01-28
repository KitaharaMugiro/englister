import 'package:englister/pages/home.dart';
import 'package:englister/pages/phrase.dart';
import 'package:englister/pages/record.dart';
import 'package:englister/route/setting.dart';
import 'package:flutter/material.dart';

import 'components/drawer/MyDrawer.dart';
import 'components/navigation/MyBottomNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Englister',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IndexPage(title: 'Englister'),
      routes: {'/settings': (BuildContext context) => new SettingPage()},
    );
  }
}

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RecordPage(),
    PhrasePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 23, fontWeight: FontWeight.w500),
        actions: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15)),
                onPressed: () {},
                child: const Text('Log in'),
              ))
        ],
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(_selectedIndex, _onItemTapped),
      body: _widgetOptions.elementAt(_selectedIndex),
      backgroundColor: Colors.grey[50],
    );
    return scaffold;
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      DrawerHeader(
          child: Center(
        child: Column(children: [
          SizedBox(height: 15),
          CircleAvatar(
            child: const Text('A'),
            radius: 40,
          ),
          SizedBox(height: 15),
          Text('Anon', style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
      )),
      ListTile(
        leading: Icon(Icons.local_library),
        title: Text('勉強する'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.people),
        title: Text('追加機能リクエスト'),
        onTap: () => launch(
            "https://docs.google.com/forms/d/e/1FAIpQLSdiBErG8O7zFEZYlODFk4p27GjwbFjV4ehp9SO8OZ3cffuMcA/viewform?usp=sf_link"),
      ),
      ListTile(
          leading: Icon(Icons.settings),
          title: Text('設定'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/settings');
          }),
    ]));
  }
}

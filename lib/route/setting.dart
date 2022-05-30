import 'package:englister/models/auth/AuthService.dart';
import 'package:englister/models/riverpod/SettingRiverpod.dart';
import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends HookConsumerWidget {
  final listItems = [
    {
      "title": "お問い合わせ",
      "url":
          "https://docs.google.com/forms/d/e/1FAIpQLSfpVp24DmJSR5IvLVqy0AuXSt1ZNxyAMxONMSZMEebh2EYqxw/viewform"
    },
    {"title": "利用規約", "url": "https://englister.yunomy.com/t/terms_of_service"},
    {
      "title": "プライバシーポリシー",
      "url": "https://englister.yunomy.com/t/privacy_policy"
    },
    {"title": "特定商取引法に基づく表記", "url": "https://englister.yunomy.com/t/legal"},
  ];

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  List<Widget> _makeWidgets(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);
    var userNotifier = ref.watch(userProvider.notifier);
    var themeMode = ref.watch(SettingProvider);
    var themeModeNotifier = ref.watch(SettingProvider.notifier);
    var contentWidgets = <Widget>[];

    for (var item in listItems) {
      contentWidgets.add(Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Theme.of(context).dividerColor))),
        child: ListTile(
          title: Text(item["title"] ?? ""),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            _launchURL(item["url"] ?? "");
          },
        ),
      ));
    }

    contentWidgets.add(const SizedBox(height: 20));

    //ダークモード切り替え
    contentWidgets.add(Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Theme.of(context).dividerColor))),
      child: ListTile(
        title: const Text("Dark Mode"),
        trailing: Switch(
          value: themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeModeNotifier.change(value ? ThemeMode.dark : ThemeMode.light);
          },
        ),
      ),
    ));

    if (user.sub != null) {
      contentWidgets.add(Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(
                  bottom: BorderSide(
                      width: 1.0, color: Theme.of(context).dividerColor))),
          child: ListTile(
            title: const Text("ログアウト"),
            onTap: () async {
              await AuthService.signOut();
              userNotifier.set(UserAttribute());
              Navigator.pop(context);
            },
          )));
    }
    return contentWidgets;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("設定"),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: Container(
            margin: const EdgeInsets.only(top: 20),
            child: ListView(children: _makeWidgets(context, ref))));
  }
}

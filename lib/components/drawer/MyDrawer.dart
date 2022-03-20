import 'package:englister/api/rest/StudyApi.dart';
import 'package:englister/api/rest/SubscriptionApi.dart';
import 'package:englister/components/drawer/LeftPlanHearts.dart';
import 'package:englister/models/riverpod/LeftHeartsRiverpod.dart';
import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:englister/pages/plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var heart = useState<num>(0);
    var user = ref.watch(userProvider);
    var leftHearts = ref.watch(leftHeartsProvider);
    var leftHeartsNotifier = ref.watch(leftHeartsProvider.notifier);
    var maxHearts = ref.watch(maxHeartsProvider);
    var maxHeartsNotifier = ref.watch(maxHeartsProvider.notifier);
    var userEmail = user.email;

    useEffect(() {
      SubscriptionApi.getPurchasedHeart().then((value) {
        debugPrint(value.count.toString());
        heart.value = value.count;
      }).catchError((e) {
        debugPrint("Error on MyDrawer↓");
        debugPrint(e);
        heart.value = 0;
      });

      StudyApi.leftHeart().then((value) {
        leftHeartsNotifier.set(value.leftHeart);
      }).catchError((e) {
        debugPrint("Error on MyDrawer↓");
        debugPrint(e);
        leftHeartsNotifier.set(0);
      });

      SubscriptionApi.getCurrentPlan().then((plan) {
        if (plan.plan == "3" && plan.status == "active") {
          maxHeartsNotifier.set(3);
        } else if (plan.plan == "10" && plan.status == "active") {
          maxHeartsNotifier.set(10);
        } else if (plan.plan == "unlimited" && plan.status == "active") {
          maxHeartsNotifier.set(300);
        } else {
          maxHeartsNotifier.set(0);
        }
      });
    }, []);

    return Drawer(
        child: ListView(children: [
      DrawerHeader(
          child: Center(
        child: Column(children: [
          // CircleAvatar(
          //   child: Text(userEmail?.substring(0, 1) ?? 'A'),
          //   radius: 20,
          // ),
          const SizedBox(height: 10),
          Text(userEmail ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Text("残りライフ"),
          LeftPlanHearts(
              hearts: leftHearts, maxHearts: maxHearts, showText: true),
          Text("❤️ × ${heart.value}"),
        ]),
      )),
      ListTile(
        leading: Icon(Icons.local_library),
        title: Text('勉強する'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.local_library),
        title: Text('ダッシュボード'),
        onTap: () => launch("https://english.yunomy.com/dashboard"),
      ),
      ListTile(
        leading: Icon(Icons.local_library),
        title: Text('プラン'),
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlanPage(),
                fullscreenDialog: true,
              ));
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

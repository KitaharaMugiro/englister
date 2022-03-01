import 'dart:developer';

import 'package:englister/components/plan/PlanCard.dart';
import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PlanPage extends HookConsumerWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);
    var products = useState<List<ProductDetails>>([]);
    useEffect(() {
      Future<void> _loadData() async {
        const Set<String> _kIds = <String>{
          'heart_10',
          'heart_100',
          'heart_300'
        };
        final ProductDetailsResponse response =
            await InAppPurchase.instance.queryProductDetails(_kIds);
        if (response.notFoundIDs.isNotEmpty) {
          // Handle the error.
          debugPrint("Not Found items");
        }
        List<ProductDetails> _products = response.productDetails;
        products.value = _products;
      }

      _loadData();
    }, []);

    void buyPlan(String id) {
      var index = products.value.indexWhere(
        (element) => element.id == id,
      );
      if (index == -1) {
        debugPrint("Product not found");
        return;
      }
      var productDetails = products.value[index];
      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: productDetails);
      InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
    }

    Widget _renderPlan() {
      return Column(
        children: [
          PlanCard(
            title: "ハート300個",
            price: "8500円",
            description: "ほとんど解き放題",
            onTap: () {
              buyPlan("heart_300");
            },
          ),
          PlanCard(
            title: "ハート100個",
            price: "5500円",
            description: "がっつり解きたいとき",
            onTap: () {
              buyPlan("heart_100");
            },
          ),
          PlanCard(
            title: "ハート10個",
            price: "1100円",
            description: "ちょっとハートを追加したいとき",
            onTap: () {
              buyPlan("heart_10");
            },
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('プラン'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text("プラン",
                style:
                    Typography.dense2018.headline4?.apply(fontWeightDelta: 3)),
            Text("圧倒的に継続しやすい価格。", style: Typography.dense2018.caption),
            const SizedBox(height: 10),
            _renderPlan()
          ],
        ),
      ),
    );
  }
}

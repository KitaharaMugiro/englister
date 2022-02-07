import 'dart:developer';

import 'package:englister/components/plan/PlanCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PlanPage extends HookConsumerWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var products = useState<List<ProductDetails>>([]);
    useEffect(() {
      Future<void> _loadData() async {
        const Set<String> _kIds = <String>{'plan_1', 'plan_2', 'plan_3'};
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
      InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
    }

    Widget _renderPlan() {
      // var plan1 = products.value.firstWhere(
      //   (element) => element.id == "plan_1",
      // );
      // var plan2 = products.value.firstWhere(
      //   (element) => element.id == "plan_2",
      // );
      // var plan3 = products.value.firstWhere(
      //   (element) => element.id == "plan_3",
      // );

      return Column(
        children: [
          PlanCard(
            title: "Unlimitedプラン",
            price: "3000円/月",
            description: "問題解き放題",
            onTap: () {
              buyPlan("plan_3");
            },
          ),
          PlanCard(
            title: "がっつりプラン",
            price: "1500円/月",
            description: "10問/日まで",
            onTap: () {
              buyPlan("plan_2");
            },
          ),
          PlanCard(
            title: "継続プラン",
            price: "500円/月",
            description: "3問/日まで",
            onTap: () {
              buyPlan("plan_1");
            },
          )
        ],
      );
    }

    // if (products.value.isEmpty) {
    //   return const CircularProgressIndicator();
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('遷移後のページ'),
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

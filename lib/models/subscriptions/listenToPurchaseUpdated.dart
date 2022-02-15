import 'dart:io';

import 'package:englister/api/rest/SubscriptionApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

void _handleError(IAPError error) {
  debugPrint(error.toString());
}

/// CloudFunctions経由でレシート検証, 期限検証, (検証成功であれば)Firestoreへレシート登録を行う
Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
  print("VERIFY PURCHASE");

  try {
    // iOSのレシート検証
    var productId = purchaseDetails.productID;
    debugPrint(productId + "を購入依頼");
    var result = await SubscriptionApi.purchaseHeart(productId);
    if (result.result != null && result.result == true) {
      // 検証成功
      print("VERIFY SUCCESS");
      return true;
    }

    print("VERIFY FAILED");
    return false;
  } catch (_) {
    print("VERIFY PURCHASE FAILED(ERROR)");
    return false;
  }
}

void listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
  print("LISTEN TO PURCHASE UPDATED");
  if (purchaseDetailsList.isEmpty) {
    return;
  }

  purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
    if (purchaseDetails.status == PurchaseStatus.pending) {
      //_showPendingUI();
      EasyLoading.show(status: 'loading...');
    } else {
      if (purchaseDetails.status == PurchaseStatus.error) {
        _handleError(purchaseDetails.error!);
        EasyLoading.dismiss();
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        await _verifyPurchase(purchaseDetails);
        EasyLoading.dismiss();
      }
      if (purchaseDetails.pendingCompletePurchase) {
        debugPrint("Successfully completed purchase!!");
        await InAppPurchase.instance.completePurchase(purchaseDetails);
        EasyLoading.dismiss();
      }
    }
  });
}

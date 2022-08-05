import 'package:englister/models/riverpod/UserRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/diary/DiaryCard.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

final queryDocument = gql(
  r'''
    subscription ListMyDiary($userId: String!) {
        englister_Diary(order_by: {createdAt: desc_nulls_last}, where: {createdBy: {_eq: $userId}}) {
          createdAt
          createdBy
          id
          protected
          translatedEnglish
          translatedJapanese
          updatedAt
          userInputEnglish
          userInputText
        }
      }
  ''',
);

class DiaryPage extends HookConsumerWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);

    if (user.sub == null) {
      return const Center(
        child: Text("ログインすると日記を表示できます"),
      );
    }

    return Subscription(
        options: SubscriptionOptions(
          document: queryDocument, // this is the query string you just created
          variables: {
            'userId': user.sub,
          },
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final diaries = result.data?["englister_Diary"] as List<dynamic>;

          if (diaries.isEmpty) {
            return TextButton(onPressed: () {}, child: const Text("日記を書いてみよう"));
          }

          var contentWidgets = <Widget>[];
          contentWidgets.add(Text("日記", style: Typography.dense2018.headline5));
          contentWidgets.add(const SizedBox(height: 20));

          for (var record in diaries) {
            contentWidgets.add(DiaryCard(
              userInputEnglish: record["userInputEnglish"],
              translatedEnglish: record["translatedEnglish"],
              userInputText: record["userInputText"],
              date: record["createdAt"],
            ));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: contentWidgets,
          );
        });
  }
}

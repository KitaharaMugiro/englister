import 'package:englister/components/phrase/PhraseInput.dart';
import 'package:englister/components/phrase/PhraseListItem.dart';
import 'package:englister/models/riverpod/PhraseRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final queryDocument = gql(
  r'''
    subscription ListPhraseQuery {
      englister_Phrase(order_by: {created_at: desc}) {
        id
        phrase
        description
        created_at
        updated_at
      }
    }
  ''',
);

class PhraseList extends HookConsumerWidget {
  const PhraseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var phrasesNotifier = ref.watch(phrasesProvider.notifier);

    return Subscription(
      options: SubscriptionOptions(
        document: queryDocument,
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        //WARN: ここの型が効かないのやだなあ
        final phrases = result.data?["englister_Phrase"]
            as List<dynamic>; //id, phrase, description, created_at, updated_at
        var contentWidgets = <Widget>[];
        contentWidgets.add(Text("フレーズ", style: Typography.dense2018.headline5));
        contentWidgets.add(const SizedBox(height: 10));
        contentWidgets.add(PhraseInput());
        for (var phrase in phrases) {
          contentWidgets.add(
            PhraseListItem(
                description: phrase["description"],
                phrase: phrase["phrase"],
                phraseId: phrase["id"]),
          );
          contentWidgets.add(Divider(
            color: Theme.of(context).dividerColor,
          ));
        }

        return ListView(
            padding: const EdgeInsets.all(16), children: contentWidgets);
      },
      onSubscriptionResult: (subscriptionResult, client) {
        //WARN: ここの型が効かないのやだなあ
        final phrases =
            subscriptionResult.data?["englister_Phrase"] as List<dynamic>;
        //builderでsetするとエラーになるのでここでやる
        phrasesNotifier.set(phrases);
      },
    );
  }
}

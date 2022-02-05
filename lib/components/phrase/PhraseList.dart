import 'package:englister/components/phrase/PhraseInput.dart';
import 'package:englister/components/phrase/PhraseListItem.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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

class PhraseList extends StatelessWidget {
  const PhraseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          final phrases = result.data?["englister_Phrase"] as List<
              dynamic>; //id, phrase, description, created_at, updated_at
          var contentWidgets = <Widget>[];
          contentWidgets
              .add(Text("フレーズ", style: Typography.dense2018.headline5));
          contentWidgets.add(SizedBox(height: 10));
          contentWidgets.add(PhraseInput());
          for (var phrase in phrases) {
            contentWidgets.add(
              PhraseListItem(
                  description: phrase["description"],
                  phrase: phrase["phrase"],
                  phraseId: phrase["id"]),
            );
            contentWidgets.add(Divider(
              color: Colors.grey[400],
            ));
          }

          return ListView(
              padding: EdgeInsets.all(16), children: contentWidgets);
        });
  }
}

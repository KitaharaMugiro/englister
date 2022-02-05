import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final queryDocument = gql(
  r'''
    mutation DeletePhrase($id: Int!) {
      delete_englister_Phrase_by_pk( id: $id) {
        id
        phrase
        description
        created_at
        updated_at
      }
    }
  ''',
);

class PhraseListItem extends StatelessWidget {
  PhraseListItem({
    Key? key,
    required String this.description,
    required String this.phrase,
    required num this.phraseId,
  }) : super(key: key);
  String description;
  String phrase;
  num phraseId;

  void showDeleteAlert(BuildContext context, Function action) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(title: Text("削除してもよろしいですか？"), actions: [
            TextButton(
              child: Text("CANCEL"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () {
                action();
                Navigator.pop(context);
              },
            )
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
        builder: (runMutation, result) {
          return ListTile(
              title: Text(description,
                  style: Typography.englishLike2018.headline5),
              subtitle: Text(phrase, style: Typography.dense2018.bodyText2),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDeleteAlert(context, () {
                    runMutation({
                      "id": phraseId,
                    });
                  });
                },
              ));
        },
        options: MutationOptions(
          document: queryDocument,
        ));
  }
}

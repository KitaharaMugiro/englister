import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final queryDocument = gql(r'''
  mutation SavePhrase($phrase: String!, $description: String!) {
    insert_englister_Phrase_one(object:{phrase:$phrase, description:$description}) {
      id
      phrase
      description
      created_at
      updated_at
    }
  }
''');

class PhraseInput extends StatelessWidget {
  PhraseInput({Key? key}) : super(key: key);
  var phraseController = TextEditingController();
  var descriptionController = TextEditingController();

  void onPressed(BuildContext context, Function action) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("新しいフレーズを登録する"),
            content: Form(
                child: SizedBox(
                    height: 200.0,
                    width: 400.0,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: phraseController,
                          decoration: const InputDecoration(
                              hintText: "On the other hand,",
                              labelText: 'フレーズ'),
                          autofocus: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (v) {
                            if (v?.isEmpty ?? true) {
                              return 'required';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              hintText: "一方で〜", labelText: 'フレーズの説明'),
                          autofocus: false,
                        ),
                      ],
                    ))),
            actions: [
              TextButton(
                child: const Text("CANCEL"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    String phrase = phraseController.text;
                    String description = descriptionController.text;
                    bool valid = (phrase.isNotEmpty && description.isNotEmpty);
                    print(valid);
                    if (valid) {
                      // mutation呼ぶ
                      action(phrase, description);

                      // close dialog
                      Navigator.pop(context);
                    }
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Mutation(
      builder: (runMutation, result) {
        // ignore: prefer_function_declarations_over_variables
        Function action = (String phrase, String description) {
          //つらいけど逆にする
          runMutation({
            'phrase': description,
            'description': phrase,
          });

          //ここでどうやってrefetchさせる？？？
        };

        return ElevatedButton(
            onPressed: () => onPressed(context, action),
            child: const Text("新しいフレーズを登録する"));
      },
      options: MutationOptions(document: queryDocument),
    );
  }
}

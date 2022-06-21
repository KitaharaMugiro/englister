import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:random_avatar/random_avatar.dart';

final queryDocument = gql(
  r'''
    query queryPublicJapanese($topicId: Int!) {
      englister_PublicAnswers(
          where:{topicId:{_eq:$topicId}, japanese:{_neq:""} },
          order_by:{createdAt:desc},
          limit:5) {
        id
        topicId
        japanese
        createdBy
        createdAt
      }
    }
  ''',
);

class PublicJapaneseList extends HookConsumerWidget {
  PublicJapaneseList({
    Key? key,
    required this.topicId,
  }) : super(key: key);
  int topicId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Query(
      options: QueryOptions(
        document: queryDocument, // this is the query string you just created
        variables: {
          'topicId': topicId,
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

        final answers =
            result.data?["englister_PublicAnswers"] as List<dynamic>;

        if (answers.isEmpty) {
          return TextButton(
              onPressed: () {},
              child: const Text("他の人の意見を参考にする\n(まだ他の人の投稿がありません)"));
        }

        return TextButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.forum,
                          size: 27,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('他の人の意見'),
                      ],
                    ),
                    content: SizedBox(
                      height: 450.h,
                      width: 400.w,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: answers.length,
                          itemBuilder: (context, index) {
                            final answer = answers[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    randomAvatar(
                                      DateTime.now().toIso8601String(),
                                      height: 30,
                                      width: 30,
                                    ),
                                    Text(
                                      answer["japanese"],
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              )),
                            );
                          }),
                    ),
                  );
                },
              );
            },
            child: const Text("他の人の意見を参考にする"));
      },
    );
  }
}

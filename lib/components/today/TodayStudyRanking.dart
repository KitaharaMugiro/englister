import 'package:englister/components/today/TodayStudyRankingItem.dart';
import 'package:englister/models/riverpod/TodayStudyRiverpod.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final queryDocument = gql(
  r'''
    query queryTodayPublciAnswerRanking($todayTopicId: String!) {
      englister_PublicAnswers(
          where:{todayTopicId:{_eq:$todayTopicId}}, 
          order_by:{age:desc},
          limit:50) {
        id
        topicId
        answer
        japanese
        translation
        age
        name
        createdBy
        createdAt
      }
    }
  ''',
);

class TodayStudyRanking extends HookConsumerWidget {
  const TodayStudyRanking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todayTopic = ref.watch(todayTopicProvider);
    return Query(
      options: QueryOptions(
        document: queryDocument, // this is the query string you just created
        variables: {
          'todayTopicId': todayTopic?.question.todayTopicId,
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
          return Text("まだ他の人は回答を投稿していません",
              style: Typography.dense2018.bodyText1);
        }

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: answers.length,
            itemBuilder: (context, index) {
              final answer = answers[index];
              return TodayStudyRankingItem(
                age: answer["age"],
                index: index,
                name: answer["name"],
              );
            });
      },
    );
  }
}

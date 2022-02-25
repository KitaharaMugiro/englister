import 'package:englister/api/rest/CategoryApi.dart';
import 'package:englister/api/rest/TopicApi.dart';
import 'package:englister/components/study/main/StudyStepper.dart';
import 'package:englister/models/study/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryStartFrame extends HookConsumerWidget {
  CategoryStartFrame({Key? key, categorySlug, onClick}) : super(key: key);
  String categorySlug = "";
  Function? onClick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const BASE_URL = 'https://english.yunomy.com';
    var category = useState<Category?>(null);
    var doneTopicNum = useState(0);
    var allTopicNum = useState(0);
    var noMore = useState(false);
    useEffect(() {
      if (categorySlug != null) {
        TopicApi.getDoneTopicIds(categorySlug).then((results) {
          doneTopicNum.value = results.length;
        });
        TopicApi.getAllTopicIds(categorySlug).then((results) {
          allTopicNum.value = results.length;
        });
      }

      useEffect(() {
        if (doneTopicNum == allTopicNum) {
          noMore.value = true;
        } else {
          noMore.value = false;
        }
      }, [doneTopicNum, allTopicNum]);
    }, [categorySlug]);

    useEffect(() {
      if (categorySlug != null) {
        CategoryApi.getCategoryDetail(categorySlug).then((_category) {
          category.value = _category;
        });
      }
    }, [categorySlug]);

    if (allTopicNum.value == 0) {
      return const Center(child: CircularProgressIndicator());
    }

    var imageUrl = "";
    var path = category.value?.categoryImageUrl;
    if (path != null) {
      imageUrl = BASE_URL + path;
    }

    return Container(
        child: Card(
      elevation: 3,
      margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Column(
        children: [
          Image(
            image: NetworkImage(imageUrl),
          ),
        ],
      ),
    ));
  }
}

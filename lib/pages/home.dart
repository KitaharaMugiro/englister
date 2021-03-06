import 'package:englister/api/rest/CategoryApi.dart';
import 'package:englister/api/rest/response_type/get_category_list_response.dart';
import 'package:englister/components/card/CategoryCard.dart';
import 'package:englister/route/studyStart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var categoryList = useState<GetCategoryListResponse?>(null);
    var isLoading = useState(false);

    const BASE_URL = 'https://englister.yunomy.com';

    useEffect(() {
      isLoading.value = true;
      CategoryApi.getCategoryList().then((value) {
        categoryList.value = value;
        isLoading.value = false;
      }).catchError((e) {
        print(e);
        isLoading.value = false;
      });
      return null;
    }, []);

    void onTapCard(String category, String title) async {
      EasyLoading.show(status: 'loading...');
      try {
        if (category == 'today') {
          Navigator.pushNamed(context, '/today');
          EasyLoading.dismiss();
          return;
        }

        Navigator.pushNamed(context, '/study/start',
            arguments: StudyStartPageArguments(category, title));
      } catch (e) {
        print(e);
      }

      EasyLoading.dismiss();
    }

    if (isLoading.value) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Container(
        child: Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.school),
            const SizedBox(
              width: 5,
            ),
            Text("英作文コース一覧", style: Typography.dense2018.headline5),
          ],
        ),
      ),
      Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: categoryList.value!.popular!.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return CategoryCard(
                  onTap: onTapCard,
                  imageURL:
                      'https://englister.yunomy.com/static/ogp/slide_6.png',
                  title: '今日の英語年齢診断',
                  category: 'today',
                );
              }
              var category = categoryList.value!.popular![index - 1];
              return CategoryCard(
                onTap: onTapCard,
                imageURL: BASE_URL + category.categoryImageUrl,
                title: category.categoryName,
                category: category.categorySlug,
              );
            }),
      ),
    ]));
  }
}

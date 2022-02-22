import 'package:englister/api/rest/CategoryApi.dart';
import 'package:englister/api/rest/StudyApi.dart';
import 'package:englister/api/rest/response_type/get_category_list_response.dart';
import 'package:englister/components/card/CategoryCard.dart';
import 'package:englister/components/dialog/showHeartShortError.dart';
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

    const BASE_URL = 'https://english.yunomy.com';

    useEffect(() {
      isLoading.value = true;
      CategoryApi.getCategoryList().then((value) {
        categoryList.value = value;
        isLoading.value = false;
      }).catchError((e) {
        print(e);
        isLoading.value = false;
      });
    }, []);

    void onTapCard(String category) async {
      EasyLoading.show(status: 'loading...');
      print("onTapCard: $category");
      try {
        await StudyApi.studyStart(category);
        Navigator.pushNamed(context, '/study', arguments: category);
      } catch (e) {
        print(e);
        showHeartShortError(context);
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
      Container(
        height: 20,
      ),
      Text("コンテンツ一覧", style: Typography.dense2018.headline4),
      Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: categoryList.value!.popular!.length,
            itemBuilder: (BuildContext context, int index) {
              var category = categoryList.value!.popular![index];
              return CategoryCard(
                onTap: onTapCard,
                imageURL: category.categorySlug == 'free'
                    ? 'https://assets.media-platform.com/bi/dist/images/2021/03/19/black-w960.jpeg'
                    : (BASE_URL + category.categoryImageUrl), //判定微妙かも
                title: category.categoryName,
                category: category.categorySlug,
              );
            }),
      ),
    ]));
  }
}

import 'package:englister/components/phrase/flash_cards/FlashCards.dart';
import 'package:englister/components/phrase/flash_cards/FlashCardsMainFrame.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';

class PhraseStudyPage extends HookConsumerWidget {
  const PhraseStudyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('フラッシュカードで覚える'),
        ),
        body: const FlashCardsMainFrame());
  }
}

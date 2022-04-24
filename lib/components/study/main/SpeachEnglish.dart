import 'package:avatar_glow/avatar_glow.dart';
import 'package:englister/models/riverpod/StudyModeRiverpod.dart';
import 'package:englister/models/riverpod/StudyRiverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeachEnglish extends HookConsumerWidget {
  const SpeachEnglish(
    this.textEditingController, {
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sttModeNotifier = ref.watch(sttModeProvider.notifier);
    var studyState = ref.watch(studyProvider);
    var studyNotifier = ref.watch(studyProvider.notifier);

    final lastWords = useState("");
    final spokenWords = useState("");
    final isListening = useState(false);

    final SpeechToText speech = SpeechToText();

    void resultListener(SpeechRecognitionResult result) {
      lastWords.value = result.recognizedWords;
    }

    void errorListener(SpeechRecognitionError error) {
      if (kDebugMode) {
        print('${error.errorMsg} - ${error.permanent}');
      }
    }

    void handleStop() {
      isListening.value = false;
      if (spokenWords.value.isEmpty) {
        spokenWords.value = lastWords.value;
      } else {
        spokenWords.value +=
            lastWords.value.isNotEmpty ? ' ${lastWords.value}' : '';
      }
      lastWords.value = '';
    }

    void statusListener(String status) {
      if (kDebugMode) {
        print(status);
      }
      //Androidは数秒でストップする仕様なので、ここでisListeningなどの状態を変更したい
      //iosはそういう仕様はない？？
      if (status == "done") {
        //一度テキスト入力に戻ってもう一度音声入力を試すと、ここでstateを変更できなくなる
        //speech.initializeが２回目以降は無視されて古いリスナーが残ってしまうためだと思うが対処法が分からない
        //現状その場合は手動で音声入力をストップしてもらう必要がある
        handleStop();
      }
    }

    Future<void> _speak() async {
      bool available = await speech.initialize(
          onError: errorListener, onStatus: statusListener);
      if (available) {
        var locales = await speech.locales();
        //英語 アメリカ合衆国
        var selectedLocale =
            locales.firstWhere((element) => element.localeId == "en-US");
        if (selectedLocale == null) {
          if (kDebugMode) {
            print("The user doesn't have a language installed");
          }
          return;
        }

        speech.listen(
          onResult: resultListener,
          localeId: selectedLocale.localeId,
        );
        isListening.value = true;
      } else {
        if (kDebugMode) {
          print("The user has denied the use of speech recognition.");
        }
      }
    }

    Future<void> _stop() async {
      speech.stop();
      handleStop();
    }

    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            isListening.value
                ? Text(
                    lastWords.value.isEmpty && spokenWords.value.isEmpty
                        ? 'Speak Now...'
                        : spokenWords.value.isEmpty
                            ? lastWords.value
                            : spokenWords.value + ' ${lastWords.value}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  )
                : Text(
                    spokenWords.value.isEmpty
                        ? 'Tap To Start'
                        : spokenWords.value,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
            AvatarGlow(
              animate: isListening.value,
              glowColor: Theme.of(context).primaryColor,
              endRadius: 75.0,
              duration: const Duration(milliseconds: 2000),
              repeatPauseDuration: const Duration(milliseconds: 100),
              repeat: true,
              child: SizedBox(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  onPressed: isListening.value ? _stop : _speak,
                  child: Icon(isListening.value ? Icons.stop : Icons.mic_none,
                      size: 40),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    spokenWords.value = '';
                  },
                  child: const Text('RESET'),
                ),
                ElevatedButton(
                  onPressed: () {
                    studyNotifier
                        .set(studyState.copyWith(english: spokenWords.value));
                    textEditingController.text = spokenWords.value;
                    spokenWords.value = '';
                    sttModeNotifier.set(false);
                  },
                  child: const Text('OK'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

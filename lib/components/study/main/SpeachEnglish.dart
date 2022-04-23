import 'package:avatar_glow/avatar_glow.dart';
import 'package:englister/models/riverpod/StudyModeRiverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeachEnglish extends HookConsumerWidget {
  SpeachEnglish({
    Key? key,
  }) : super(key: key);

  final lastWords = useState('');
  final lastError = useState('');
  final lastStatus = useState('');
  final isListening = useState(false);
  stt.SpeechToText speech = stt.SpeechToText();

  Future<void> _speak() async {
    bool available = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (available) {
      speech.listen(onResult: resultListener);
      isListening.value = true;
    } else {
      if (kDebugMode) {
        print("The user has denied the use of speech recognition.");
      }
    }
  }

  Future<void> _stop() async {
    speech.stop();
    isListening.value = false;
  }

  void resultListener(SpeechRecognitionResult result) {
    lastWords.value += result.recognizedWords;
  }

  void errorListener(SpeechRecognitionError error) {
    lastError.value = '${error.errorMsg} - ${error.permanent}';
  }

  void statusListener(String status) {
    lastStatus.value = status;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sttModeNotifier = ref.watch(sttModeProvider.notifier);

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
                    lastWords.value.isEmpty ? 'Speak Now...' : lastWords.value,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  )
                : Text(
                    lastWords.value.isEmpty ? 'Tap To Start' : lastWords.value,
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
              child: FloatingActionButton(
                onPressed: isListening.value ? _stop : _speak,
                child: Icon(isListening.value ? Icons.stop : Icons.mic_none),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    lastWords.value = '';
                  },
                  child: const Text('RESET'),
                ),
                ElevatedButton(
                  onPressed: () {
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

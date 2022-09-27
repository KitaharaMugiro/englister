import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class MyCountdownTimer extends StatefulWidget {
  final int seconds;
  const MyCountdownTimer({
    Key? key,
    required this.seconds,
  }) : super(key: key);

  @override
  _MyCountdownTimerState createState() => _MyCountdownTimerState();
}

class _MyCountdownTimerState extends State<MyCountdownTimer>
    with SingleTickerProviderStateMixin {
  late CountdownTimerController controller;

  void onEnd() {
    print('onEnd');
  }

  @override
  void initState() {
    super.initState();
    int endTime = DateTime.now().millisecondsSinceEpoch +
        Duration(seconds: widget.seconds).inMilliseconds;

    controller =
        CountdownTimerController(endTime: endTime, onEnd: onEnd, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      controller: controller,
      widgetBuilder: (BuildContext context, CurrentRemainingTime? time) {
        if (time == null) {
          return const Text('残り 00:00:00',
              style: TextStyle(fontSize: 16, color: Colors.red));
        }

        List<Widget> list = [];
        String value = '残り ';

        var min = _getNumberAddZero(time.min ?? 0);
        value = '$value$min : ';
        var sec = _getNumberAddZero(time.sec ?? 0);
        value = '$value$sec : ';
        list.add(Text(value, style: Typography.dense2018.bodyText2));

        if (time.milliseconds != null) {
          list.add(AnimatedBuilder(
            animation: time.milliseconds!,
            builder: (context, child) {
              return Text("${(time.milliseconds!.value * 100).toInt()}",
                  style: Typography.dense2018.bodyText2);
            },
          ));
        }
        return Row(
          children: list,
        );
      },
    );
  }

  /// 1 -> 01
  String _getNumberAddZero(int number) {
    if (number < 10) {
      return "0" + number.toString();
    }
    return number.toString();
  }
}

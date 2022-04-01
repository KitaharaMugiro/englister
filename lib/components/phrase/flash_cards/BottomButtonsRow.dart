import 'package:englister/components/phrase/flash_cards/colors.dart';
import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomButtonsRow extends StatelessWidget {
  const BottomButtonsRow({
    required this.onRewindTap,
    required this.onSwipe,
    required this.canRewind,
    Key? key,
  }) : super(key: key);

  final bool canRewind;
  final VoidCallback onRewindTap;
  final ValueChanged<SwipeDirection> onSwipe;

  static const double height = 150;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _BottomButton(
                  color: SwipeDirectionColor.left,
                  child: const Icon(
                    FontAwesomeIcons.question,
                    size: 40,
                  ),
                  text: const Text('知らない'),
                  onPressed: () {
                    onSwipe(SwipeDirection.left);
                  }),
              _BottomButton(
                color: SwipeDirectionColor.right,
                onPressed: () {
                  onSwipe(SwipeDirection.right);
                },
                text: const Text('知ってる'),
                child: const Icon(
                  Icons.thumb_up,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({
    required this.onPressed,
    required this.child,
    required this.color,
    required this.text,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Icon child;
  final Color color;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => color,
          ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
            const SizedBox(
              height: 10,
            ),
            text
          ],
        ),
      ),
    );
  }
}

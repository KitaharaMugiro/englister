import 'package:englister/components/phrase/flash_cards/TextCard.dart';
import 'package:englister/models/riverpod/PhraseRiverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:flip_card/flip_card.dart';

import 'BottomButtonsRow.dart';
import 'CardOverlay.dart';

class FlashCards extends ConsumerStatefulWidget {
  const FlashCards({
    Key? key,
  }) : super(key: key);

  @override
  _FlashCardsState createState() => _FlashCardsState();
}

class _FlashCardsState extends ConsumerState<FlashCards> {
  late final SwipableStackController _controller;

  void _listenController() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    var phrases = ref.watch(phrasesProvider);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 150, left: 20, right: 20),
                child: SwipableStack(
                  detectableSwipeDirections: const {
                    SwipeDirection.right,
                    SwipeDirection.left,
                  },
                  controller: _controller,
                  stackClipBehaviour: Clip.none,
                  onSwipeCompleted: (index, direction) {
                    if (kDebugMode) {
                      print('$index, $direction');
                    }
                  },
                  horizontalSwipeThreshold: 0.8,
                  verticalSwipeThreshold: 0.8,
                  builder: (context, properties) {
                    final itemIndex = properties.index % phrases.length;

                    return Stack(
                      children: [
                        FlipCard(
                          fill: Fill.fillBack,
                          direction: FlipDirection.HORIZONTAL,
                          front: TextCard(
                            name: phrases[itemIndex]["phrase"],
                          ),
                          back: TextCard(
                            name: phrases[itemIndex]["description"],
                          ),
                        ),
                        // more custom overlay possible than with overlayBuilder
                        if (properties.stackIndex == 0 &&
                            properties.direction != null)
                          CardOverlay(
                            swipeProgress: properties.swipeProgress,
                            direction: properties.direction!,
                          )
                      ],
                    );
                  },
                ),
              ),
            ),
            BottomButtonsRow(
              onSwipe: (direction) {
                _controller.next(swipeDirection: direction);
              },
              onRewindTap: _controller.rewind,
              canRewind: _controller.canRewind,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping/constants/theme.dart';
import 'package:shopping/views/payment.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class AnimationSwipe extends StatefulWidget {
  const AnimationSwipe({Key? key}) : super(key: key);

  @override
  State<AnimationSwipe> createState() => _AnimationSwipeState();
}

class _AnimationSwipeState extends State<AnimationSwipe> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
                child: SwipeableButtonView(
              buttonText: 'SLIDE TO PAYMENT',
              buttonWidget: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              ),
              activeColor: kPrimaryColor,
              isFinished: isFinished,
              onWaitingProcess: () {
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    isFinished = true;
                  });
                });
              },
              onFinish: () async {
                await Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: const PaymentPage()));
                setState(() {
                  isFinished = false;
                });
              },
            )),
          ),
        ),
      ],
    );
  }
}

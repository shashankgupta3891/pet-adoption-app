import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:pet_adoption_app/core/const/media_const.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key, this.widget = 100});

  final double widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AnimationConst.loadingAnimation,
        width: widget,
      ),
    );
  }
}

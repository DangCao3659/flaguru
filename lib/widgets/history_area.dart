import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class HistoryArea extends AnimatedWidget {
  final double initHeight;

  HistoryArea({this.initHeight, Animation<double> controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final controller = listenable as Animation<double>;
    final animation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    final radius = 15.0;
    final colorAnimation = ColorTween(
      begin: const Color(0xff24b6c5),
      end: Colors.white.withOpacity(0.6),
    ).animate(controller);

    return BackdropFilter(
      filter: ui.ImageFilter.blur(
        sigmaX: animation.value * 5,
        sigmaY: animation.value * 5,
      ),
      child: Container(
        width: width * 0.8,
        height: initHeight + animation.value * (height - initHeight) * 0.8,
        margin: EdgeInsets.only(bottom: animation.value * height * 0.1),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colorAnimation.value,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
            bottomLeft: Radius.circular(animation.value * radius),
            bottomRight: Radius.circular(animation.value * radius),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: height * 0.05,
              child: RaisedButton(
                color: const Color(0xff019dad),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.cir),
                onPressed: () {},
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white.withOpacity(0.9),
                  size: height * 0.05,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

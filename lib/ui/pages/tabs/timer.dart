import 'dart:async';
import 'dart:math';

import 'package:HackRU/styles.dart';
import 'package:HackRU/ui/widgets/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  @override
  TimerState createState() {
    return new TimerState();
  }
}

class TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width - 45.0;
    final imageHeight =
        (MediaQuery.of(context).size.width <= 325) ? 150.0 : 230.0;
    final toleranceFactor = 0.033;
    final widthFactor = 0.125;
    final heightFactor = 0.5;
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    final random = Random();

    final bool debugMode = false;
    DateTime now = DateTime.now();
    DateTime dDay = DateTime(2019, 10, 20, 13, 00, 0);
    dDay = (debugMode)
        ? DateTime(
            now.year, now.month, now.day, now.hour, now.minute, now.second)
        : dDay;
    Duration _duration = dDay.difference(now);

    return Scaffold(
      backgroundColor: pink,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(0)),
              currentOrientation == Orientation.portrait
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [0, 1, 2, 3, 4, 5, 6, 7]
                          .map((count) => FlipPanel.stream(
                                itemStream: Stream.fromFuture(Future.delayed(
                                    Duration(
                                        milliseconds: random.nextInt(20) * 100),
                                    () => 1)),
                                itemBuilder: (_, value) => value <= 0
                                    ? Container(
                                        color: yellow,
                                        width: widthFactor * imageWidth,
                                        height: heightFactor * imageHeight,
                                      )
                                    : ClipRect(
                                        child: Align(
                                            alignment: Alignment(
                                                -1.0 +
                                                    count * 2 * 0.125 +
                                                    count * toleranceFactor,
                                                -1.0),
                                            widthFactor: widthFactor,
                                            heightFactor: heightFactor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                'images/hackru_banner.png',
                                                width: imageWidth,
                                                height: imageHeight,
                                              ),
                                            ))),
                                initValue: 0,
                                spacing: 0.0,
                                direction: FlipDirection.up,
                              ))
                          .toList(),
                    )
                  : Container(),
              currentOrientation == Orientation.portrait
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [0, 1, 2, 3, 4, 5, 6, 7]
                          .map((count) => FlipPanel.stream(
                                itemStream: Stream.fromFuture(Future.delayed(
                                    Duration(
                                        milliseconds: random.nextInt(20) * 100),
                                    () => 1)),
                                itemBuilder: (_, value) => value <= 0
                                    ? Container(
                                        color: yellow,
                                        width: widthFactor * imageWidth,
                                        height: heightFactor * imageHeight,
                                      )
                                    : ClipRect(
                                        child: Align(
                                            alignment: Alignment(
                                                -1.0 +
                                                    count * 2 * 0.125 +
                                                    count * toleranceFactor,
                                                1.0),
                                            widthFactor: widthFactor,
                                            heightFactor: heightFactor,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Image.asset(
                                                'images/hackru_banner.png',
                                                width: imageWidth,
                                                height: imageHeight,
                                              ),
                                            ))),
                                initValue: 0,
                                spacing: 0.0,
                                direction: FlipDirection.down,
                              ))
                          .toList(),
                    )
                  : Container(),
              SizedBox(
                height: 10.0,
              ),
              (_duration.inHours > 23 && _duration.inHours.isNegative == false)
                  ? Text(
                      'HackRU Fall 2019 In...',
                      style: TextStyle(
                        color: off_white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : (_duration.isNegative == false)
                      ? Text(
                          'HackRU Ends In...',
                          style: TextStyle(
                            color: yellow,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        )
                      : Text(''),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: FlipClock.reverseCountdown(
                  duration: _duration,
                  digitColor: pink,
                  backgroundColor: off_white,
                  digitSize:
                      (MediaQuery.of(context).size.width <= 325) ? 35.0 : 40.0,
                  width:
                      (MediaQuery.of(context).size.width <= 325) ? 25.0 : 30.0,
                  height:
                      (MediaQuery.of(context).size.width <= 325) ? 45.0 : 55.0,
                  spacing: (MediaQuery.of(context).size.width <= 325)
                      ? EdgeInsets.only(
                          bottom: 35.0,
                          right: 4.0,
                        )
                      : EdgeInsets.all(1.8),
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                  onDone: () => Text(
                    'Times Up!!\n\n Don\'t forget to submit your projects\n on DevPost. Thanks for attending\n HackRU Fall 2019!!!\n\n -- HackRU Organizing Team',
                    style: TextStyle(
                      color: pink,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'functions_public/functions.dart';
import 'widget_public.dart';

class ProcessTimelinePage extends StatefulWidget {
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, index) {
            return 
              Container(
                child: Timeline.tileBuilder(
                  theme: TimelineThemeData(
                    direction: Axis.horizontal,
                    connectorTheme: ConnectorThemeData(
                      space: 20.0,
                      thickness: 4.0,
                    ),
                  ),
                  builder: TimelineTileBuilder.connected(
                    connectionDirection: ConnectionDirection.before,
                    itemExtentBuilder: (_, __) =>
                        MediaQuery.of(context).size.width / processes.length,
                    oppositeContentsBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 1.0),
                            child: Image.asset(
                              'assets/process_timeline/status${index + 1}.png',
                              width: 35.0,
                              color: getColor(index),
                            ),
                          ),
                        ],
                      );
                    },
                    contentsBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child:ts( processes[index], TextStyle(
                        fontWeight: FontWeight.bold, color: getColor(index),),)
                       
                      );
                    },
                    indicatorBuilder: (_, index) {
                      var color;
                      var child;
                      if (index == processIndex) {
                        color = inProgressColor;
                        child = Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 1.0,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        );
                      } else if (index < processIndex) {
                        color = completeColor;
                        child = const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15.0,
                        );
                      } else {
                        color = todoColor;
                      }

                      if (index <= processIndex) {
                        return Stack(
                          children: [
                            CustomPaint(
                              size:const Size(30.0, 30.0),
                              painter: _BezierPainter(
                                color: color,
                                drawStart: index > 0,
                                drawEnd: index < processIndex,
                              ),
                            ),
                            DotIndicator(
                              size: 30.0,
                              color: color,
                              child: child,
                            ),
                          ],
                        );
                      } else {
                        return Stack(
                          children: [
                            CustomPaint(
                              size:const Size(15.0, 15.0),
                              painter: _BezierPainter(
                                color: color,
                                drawEnd: index < processes.length - 1,
                              ),
                            ),
                            OutlinedDotIndicator(
                              borderWidth: 4.0,
                              color: color,
                            ),
                          ],
                        );
                      }
                    },
                    connectorBuilder: (_, index, type) {
                      if (index > 0) {
                        if (index == processIndex) {
                          final prevColor = getColor(index - 1);
                          final color = getColor(index);
                          var gradientColors;
                          if (type == ConnectorType.start) {
                            gradientColors = [
                              Color.lerp(prevColor, color, 0.5),
                              color
                            ];
                          } else {
                            gradientColors = [
                              prevColor,
                              Color.lerp(prevColor, color, 0.5)
                            ];
                          }
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: getColor(index),
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: processes.length,
                  ),
                ),
              
            );
          },
        ),
      ),
    );
  }
}

class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius, radius)
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(
            size.width, size.height / 2, size.width + radius, radius)
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';
class Listion extends StatefulWidget {
  @override
  _ListionState createState() => _ListionState();
}

class _ListionState extends State<Listion> {
  bool value0 = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  bool hide = false;

  double height = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5,
        ),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5,
          ),
          color: const Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
             
                Expanded(
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    child: CheckboxListTile(
                      secondary: text(
                        'اسم مستخدم  فقط',
                      ),
                      checkColor: Colors.greenAccent,
                      activeColor: Colors.blue,
                      value: this.value1,
                      onChanged: (bool? value) {
                        if (value1 == true) {
                          hide = false;
                          value0 = true;
                        } else if (value1 == false) {
                          value0 = false;
                          hide = false;
                        }
                        setState(() {
                          this.value1 = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    width: 300,
                    child: CheckboxListTile(
                      secondary: ts(
                        'اسم مستخدم وكلمة مرور',
                        const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      checkColor: Colors.greenAccent,
                      activeColor: Colors.blue,
                      value: this.value0,
                      onChanged: (bool? value) {
                        if (value0 == true) {
                          value1 = true;
                          hide = false;
                        } else if (value0 == false) {
                          hide = true;
                          value1 = false;
                        }
                        setState(() {
                          this.value0 = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                        child: hide
                            ? AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                child: CheckboxListTile(
                                  secondary: text(
                                      'اسم مستخدم وكلمة\ ' '\f مرور متساوية'),
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.blue,
                                  value: this.value2,
                                  onChanged: (bool? value) {
                                    if (value2 == true) {
                                      value1 = true;
                                      hide = false;
                                    } else if (value2 == false) {
                                      hide = true;
                                      value3 = false;
                                    }
                                    if (value2 == true) {
                                    } else if (value2 == false) {}
                                    setState(() {
                                      this.value2 = value!;
                                    });
                                  },
                                ),
                              )
                            :  size(0.0,0.0,null)),
                     size(0.0,
                     1.0,null
                    ),
                    Expanded(
                        child: hide
                            ? AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                width: 100,
                                child: CheckboxListTile(
                                  secondary: text(
                                      ' اسم مستخدم وكلمة\ ' '\f مرور مختلفة'),
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.blue,
                                  value: this.value3,
                                  onChanged: (bool? value) {
                                    if (value3 == true) {
                                      //  height = 150;
                                      value1 = true;
                                      hide = false;
                                    } else if (value3 == false) {
                                      //  height = 0;
                                      hide = true;
                                      value2 = false;
                                    }
                                    // if (value3 == true) {
                                    // height = 150;
                                    // } else if (value3 == false) {
                                    // height = 0;
                                    // }
                                    setState(() {
                                      this.value3 = value!;
                                    });
                                  },
                                ),
                              )
                            :  size(0.0,0.0,null)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
//   SpinKitCubeGrid(
//   color: Colors.blue,
//   size: 20,
// );

//  SpinKitWave (
//   color: Colors.blue,
//   size: 20,
// );
//  SpinKitThreeBounce(
//   color: Colors.blue,
//   size: 20,
// );

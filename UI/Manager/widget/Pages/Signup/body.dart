import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../.././UI/Client/Pages/Main/navigattor.dart';
import '../../../../.././UI/Manager/widget/Pages/Login/login_screen.dart';
import '../../../../.././UI/Manager/widget/Pages/Signup/background.dart';
import '../../../../.././UI/Manager/widget/Pages/Signup/or_divider.dart';
import '../../../../.././UI/Manager/widget/Pages/Signup/social_icon.dart';
import '../../../../.././Api/Manager/Repositorys/User.dart';
import '../../../../.././UI/Manager/widget/Drawer/networkProfile.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  var _sex;
  var _userType;
  List<String> listOfCategory = [
    'ذكر',
    'انثى',
    'مخصص',
  ];
  List<String> listUserType = [
    'عميل',
    'مورد',
  ];
  dynamic selectedIndexUserType = 'عميل';

  dynamic selectedIndexCategory = 'مخصص';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" إنشاء حساب جديد",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: StyleWidget.grey)),
              // SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.25,
              ),
              buildTextFeildPubilc(
                buildTextFormFieldcontroller(
                  _name,
                  " ادخل  الاسم الرباعي",
                  "يجب ادخل  الاسم الرباعي",
                  const Icon(Icons.person),
                  TextInputType.text,
                ),
              ),
              buildTextFeildPubilc(
                buildTextFormFieldcontroller(
                  _username,
                  " ادخل  اسم المستخدم",
                  "يجب ادخال اسم المستخدم",
                  const Icon(Icons.email),
                  TextInputType.emailAddress,
                ),
              ),
              buildTextFeildPubilc(
                passwordTextFormFieldcontroller(
                  _password,
                  " ادخل  كلمة المرور",
                  "يجب ادخال كلمة المرور",
                  const Icon(Icons.lock),
                  const Icon(Icons.visibility),
                  TextInputType.visiblePassword,
                ),
              ),
              buildTextFeildPubilc(
                buildTextFormFieldcontroller(
                  _phone,
                  " ادخل  رقم الهاتف",
                  "يجب ادخال رقم الهاتف",
                  const Icon(Icons.phone),
                  TextInputType.phone,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 70,
                  ),
                  child: build2Container(
                      text(
                        'الجنس',
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                          ),
                          child: text(
                            'نوع الحساب',
                          )))),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: build2Container(
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 25,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(
                            2,
                          ),
                        ),
                        child: Container(
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(
                                2,
                              ),
                            ),
                            child: Container(
                              child: DropdownButton<String>(
                                dropdownColor: Color(0xFFF6F7F8),
                                isExpanded: true,
                                value: selectedIndexCategory,
                                style: TextStyle(
                                  fontSize: 100,
                                  color: Colors.purple,
                                ),
                                icon: Icon(Icons.keyboard_arrow_down),
                                underline: Container(color: Colors.purple),
                                onChanged: (newValue) {
                                  _sex = newValue;
                                  setState(() {
                                    selectedIndexCategory = newValue;
                                    print(selectedIndexCategory);
                                  });
                                },
                                items: listOfCategory.map((category) {
                                  return DropdownMenuItem<String>(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          left: 25,
                                        ),
                                        child: ts(
                                            category,
                                            TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                            ))),
                                    value: category,
                                  );
                                }).toList(),
                              ),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          2,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(
                            2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: DropdownButton<String>(
                                dropdownColor: Color(0xFFF6F7F8),
                                isExpanded: true,
                                value: selectedIndexUserType,
                                style: TextStyle(
                                  fontSize: 100,
                                  color: Colors.purple,
                                ),
                                icon: Icon(Icons.keyboard_arrow_down),
                                underline: Container(color: Colors.purple),
                                onChanged: (newValue) {
                                  _userType = newValue;
                                  if (newValue != null) {}
                                  setState(() {
                                    selectedIndexUserType = newValue;
                                    if (_userType == 'عميل') {
                                      _userType = 1;
                                    } else if (_userType == 'مورد') {
                                      _userType = 2;
                                    }
                                  });
                                },
                                items: listUserType.map((datavalue) {
                                  return DropdownMenuItem<String>(
                                    child: Container(
                                        margin: EdgeInsets.only(
                                          left: 25,
                                        ),
                                        child: ts(
                                            datavalue,
                                            TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                            ))),
                                    value: datavalue,
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DrawerWithAppBar();
                      },
                    ),
                  );
                },
                child: RoundedButton(
                    text: 'إنشاء',
                    press: () {
                      submit();
                      print(_userType.toString());
                      if (_userType == 'مورد') {
                        
                      } else if (_userType=='عميل'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavigatorScreens(),
                          ),
                        );
                      }
                    }),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  submit() {
    FocusScope.of(context).unfocus();
    final isValid = _formkey.currentState!.validate();

    if (isValid) {
      final Random random = new Random();
      int _intInRange(Random source, int start, int end) =>
          start + source.nextInt(end - start);
      String _getFourNumbers() =>
          _intInRange(random, 100000000, 999999999).toString();
      _formkey.currentState!.save();
      _submitDialog(context);
      Userapi.postUserRegstar(
          _userType,
          _name.text.trim().toLowerCase(),
          _sex,
          _password.text.trim().toLowerCase(),
          _username.text.trim().toLowerCase(),
          _phone.text,
          _getFourNumbers().toString(),
          context,
          context);
    }
  }
}

Future<Null> _submitDialog(BuildContext context) async {
  return await showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.white,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildSpinKitCubeGrid(),
                ts('. . . انتضر لحظة من فضلك',
                    TextStyle(fontFamily: StyleWidget.fontName))
              ],
            ),
          ],
        );
      });
}

//That is public parms
buildTextFormFieldcontroller(
  TextEditingController controller,
  String labelText,
  String error,
  Icon icon,
  TextInputType number,
) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: TextFormField(
      focusNode: FocusNode(canRequestFocus: false),
      keyboardType: number,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          errorStyle: const TextStyle(color: Colors.red),
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: const Color(0xFF727072),
            height: 1,
            fontSize: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          filled: true,
          fillColor: Colors.white70),
      onChanged: (String value) {},
      expands: false,
      onSaved: (value) => value = value,
      validator: (name) {
        if (name!.isEmpty) {
          return (error);
        }
        return null;
      },
    ),
  );
}

passwordTextFormFieldcontroller(
  TextEditingController controller,
  String labelText,
  String error,
  Icon icon,
  var visibility,
  TextInputType number,
) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: TextFormField(
      focusNode: FocusNode(canRequestFocus: false),
      obscureText: true,
      keyboardType: number,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: visibility,
          contentPadding: EdgeInsets.all(5.0),
          errorStyle: const TextStyle(color: Colors.red),
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: const Color(0xFF727072),
            height: 1,
            fontSize: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          filled: true,
          fillColor: Colors.white70),
      onChanged: (String value) {},
      expands: false,
      onSaved: (value) => value = value,
      validator: (name) {
        if (name!.isEmpty) {
          return (error);
        }
        return null;
      },
    ),
  );
}

buildTextFeildPubilc(final Widget child) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 4.0, right: 4.0, top: 6.0, bottom: 8.0),
          child: Row(
            children: [
              Container(
                child: Expanded(
                  child: SizedBox(
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

build2Container(
  final Widget child,
  final Widget child1,
) {
  return Column(
    children: [
      // iconButton(Icons.access_time_rounded, Colors.red, onPressed(){

      // })
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: Container(
          child: child,
        )),
        Expanded(
            child: Container(
          child: child1,
        )),
      ]),
    ],
  );
}

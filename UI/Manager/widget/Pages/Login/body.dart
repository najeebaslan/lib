import 'package:flutter/material.dart';
import '../../../../.././Api/Manager/Repositorys/User.dart';
import '../../../../.././UI/Manager/widget/Pages/Signup/background.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI//Manager/widget/Pages/Signup/body.dart';
import '../../../../.././UI/Manager/widget/Pages/Signup/signup_screen.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';
import 'login_screen.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  TextEditingController _usernamae = TextEditingController();

  TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernamae.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ts(
                  "تسجيل الدخول",
                  const TextStyle(
                      fontWeight: FontWeight.bold, color: StyleWidget.grey),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/login.svg",
                  height: size.height * 0.35,
                ),
                SizedBox(height: size.height * 0.03),
                buildTextFeildPubilc(
                  buildTextFormFieldcontroller(
                    _usernamae,
                    " ادخل  اسم المستخدم",
                    "يجب ادخال اسم المستخدم",
                    const Icon(Icons.person),
                    TextInputType.text,
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
                RoundedButton(
                  text: "تسجيل دخول",
                  press: () {
                    isLogin = true;
                    print('${isLogin}ىشة');
                    submit();
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                      (Route<dynamic> route) => false,
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SignUpScreen(),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  submit() {
    print(_password.text);
    print(_usernamae.text);
    FocusScope.of(context).unfocus();
    final isValid = _formkey.currentState!.validate();

    if (isValid) {
      _formkey.currentState!.save();
      _submitDialog(context);
      Userapi.postUserLogin(_password.text.trim().toLowerCase(), _usernamae.text.trim().toLowerCase(), context, context);
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
                  buildSpinKitWave(),
                  ts('. . . انتضر لحظة من فضلك',
                      const TextStyle(fontFamily: StyleWidget.fontName))
                ],
              ),
            ],
          );
        });
  }
}

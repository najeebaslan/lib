import 'package:flutter/material.dart';
import '../../../../.././UI/Manager/widget/Pages/Login/body.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';

class LoginScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}


class RoundedButton extends StatelessWidget {
  final String text;
   final Function() press;
  final Color color, textColor;
  const RoundedButton( {
      Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor,fontWeight: FontWeight.bold,),
          ),
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;

  final   Function() press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            login ? " ليس لدي حساب ? " : " بالفعل امتلك حساب ? ",
            style:const TextStyle(color: dart),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              login ? " إنشاء " : " تسجيل الدخول",
              style:const TextStyle(
                color: dart,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

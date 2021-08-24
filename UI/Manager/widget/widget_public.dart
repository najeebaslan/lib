import 'package:flutter/material.dart';
import 'package:wirless_wifi/Api/Manager/Models/Package.dart';
import 'package:wirless_wifi/Api/Manager/Repositorys/offers.dart';

import 'style_app/Style_widget.dart';


text(
  String text,
) {
  return Text(
    text,
  );
}

//this Text with Style
ts(String text, TextStyle? style) {
  return Text(
    text,
    style: style,
  );
}

size(double height, width, Widget? child) {
  return SizedBox(
    height: height,
    width: width,
    child: child,
  );
}

class RaisedButtons extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  const RaisedButtons(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: child,
      color: color,
    );
  }
}

builddetails(String string1, String string2, double fontSize) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              string1,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                color: Color(0xFFFFFFFF),
              ),
            ),
            Text(
              string2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                letterSpacing: 0.2,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

buildTextFormField(
  TextEditingController controller,
  String errore1,
  String? hintText,
  TextInputType textInputType
) {
  return TextFormField(
    focusNode: FocusNode(canRequestFocus: false),
    keyboardType:textInputType,
    cursorColor: Colors.blue,
    controller: controller,
    minLines: null,
    maxLines: null,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(1.0),
        focusColor: Colors.orange,
        hintText: hintText,
        hintStyle: const TextStyle(fontFamily:StyleWidget.fontName),
        hoverColor: Colors.red,
        errorStyle: const TextStyle(
          color: Colors.red,
          height: 1,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        filled: true,
        fillColor: Colors.white70),
    expands: false,
    validator: (name) {
      if (name!.isEmpty) {
        return (errore1);
      }
      return null;
    },
  );
}

buildbuttum(DropdownButtonFormField dropdownButtonFormField,
    TextFormField textFormField, String string) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5,
        ),
        color: Colors.grey,
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            4,
          ),
          color: Colors.white,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: dropdownButtonFormField,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: textFormField,
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: ts(
                            string,
                            const TextStyle(
                              fontFamily: StyleWidget.fontName,
                            ))),
                  ),
                ],
              )),
        ]),
      ),
    ),
  );
}

buildOffer(
  BuildContext context,
  GlobalKey<FormState> _formkeypackages,
  dynamic 
  _value1,
  _value2,
  _value3,
  _value4,
  void setState,
  TextEditingController time,
  validity,
  data,
  offer,
  limiteUptime,
  double height,
  Package package,
  String networkId,
) {
  return Form(
    key: _formkeypackages,
    child: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5,
                ),
                color: StyleWidget.white,
              ),
              child: buildTextFormField(offer, "يجب ادخال مناسبة العرض",
                  '                             مناسبة العرض', TextInputType.text),
            ),
          ),
          sizedBox(height),
          buildbuttum(
            DropdownButtonFormField<String>(
              focusNode: FocusNode(canRequestFocus: false),
              value: _value1,
              hint: ts('الوقت',
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              onChanged: (salutation) => setState = _value1 = salutation!,
              validator: (value) => value == null ? 'حدد الوقت' : null,
              items: [
                'ساعة',
                'يوم',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: text(value),
                );
              }).toList(),
            ),
            buildTextFormField(time, "يجب ادخال وقت الاستخدام", null, TextInputType.number),
            'وقت الاستخدام',
          ),
          sizedBox(height),
          buildbuttum(
            DropdownButtonFormField<String>(
              focusNode: FocusNode(canRequestFocus: false),
              value: _value2,
              hint: ts('الصلاحية',
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              onChanged: (salutation) => setState = _value2 = salutation,
              validator: (value) => value == null ? 'حدد الصلاحية' : null,
              items: ['ساعة', 'يوم', 'شهر']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: text(value),
                );
              }).toList(),
            ),
            buildTextFormField(validity, "يجب ادخال الصلاحية", null, TextInputType.number),
            'الصلاحية',
          ),
          sizedBox(height),
          buildbuttum(
            DropdownButtonFormField<String>(
              focusNode: FocusNode(canRequestFocus: false),
              value: _value3,
              hint: ts('البيانات',
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              onChanged: (salutation) => setState = _value3 = salutation,
              validator: (value) => value == null ? 'حدد البيانات' : null,
              items: [
                'ميجا',
                'جيجا',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: text(value),
                );
              }).toList(),
            ),
            buildTextFormField(data, "يجب ادخال البيانات", null, TextInputType.number),
            'البيانات',
          ),
          sizedBox(height),
          buildbuttum(
            DropdownButtonFormField<String>(
              focusNode: FocusNode(canRequestFocus: false),
              value: _value4,
              hint: ts('وقت الانتهاء',
                  TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              onChanged: (salutation) => setState = _value4 = salutation,
              validator: (value) => value == null ? 'حدد الوقت' : null,
              items: [
                'ساعه',
                'يوم',
                'شهر',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: text(value),
                );
              }).toList(),
            ),
            buildTextFormField(limiteUptime, " يجب ادخال وقت الانتهاء ", null, TextInputType.number),
            'وقت انتهاء العرض',
          ),
          sizedBox(height),
          Center(
            child: RaisedButton(
                elevation: 5,
                color: Colors.blue,
                child: ts('اضافه',
                    const TextStyle(color: Colors.white, fontFamily: StyleWidget.fontName)),
                onPressed: () {
                  // WidgetsBinding.instance!.addPostFrameCallback((_) {
                  //   Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => ThirdScreenState(),
                  //       ));
                  // });

                  if (_formkeypackages.currentState!.validate()) {
                    _formkeypackages.currentState!.save();
                    Offersapi.postOffers(
                        package.packagePriceId.packagePrice,
                        offer.text,
                        data.text,
                        _value3,
                        time.text,
                        _value1,
                        validity.text,
                        _value2,
                        limiteUptime.text,
                        _value4,
                        networkId,
                        );
                    print(_value2.toString());

                    Navigator.of(context).pop();
                  
                  }
                }),
          ),
        ],
      ),
    ),
  );
}

SizedBox sizedBox(double height) {
  return SizedBox(
    height: height,
  );
}
Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFF201F1F),
        // color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
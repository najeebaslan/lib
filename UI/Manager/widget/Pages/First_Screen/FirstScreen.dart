import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../../.././Api/Manager/Models/Governorate%20.dart';
import '../../../../.././Api/Manager/Repositorys/Governorate%20.dart';
import '../../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../../.././Api/Manager/Repositorys/User.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/Style_widget.dart';
import '../../../../.././UI/Manager/widget/style_app/Them.dart';
import '../../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../../.././UI/Manager/widget/timelines.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';
import 'package:http/http.dart' as http;

import '../../widget_public.dart';


class FirstScreen extends StatefulWidget {
  TextEditingController nameA = TextEditingController();
  TextEditingController nameE = TextEditingController();
  TextEditingController iamge = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController isActive = TextEditingController();
  TextEditingController userInitiate = TextEditingController();
  TextEditingController phones = TextEditingController();
  TextEditingController governorate = TextEditingController();
  TextEditingController city = TextEditingController();

  TextEditingController maintenancephone = TextEditingController();
  TextEditingController maintenancephone1 = TextEditingController();
  late final void Function(File pickedImage) imagePickFn;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formkey = GlobalKey<FormState>();
  // This is for image Network

  // This is url image
  String url = "http://172.16.0.8:3000/network/add/image";
  File? _file;
  Future picketimage() async {
    final myfile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _file = File(myfile!.path);
      print(_file);
    });
  }

  Future<String?> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('img', filename));
    var res = await request.send();
    print(res);
    return res.reasonPhrase;
  }

//This is for Autocomplete
  String? string;
  static final List<String> cities = List.generate(20, (index) => '');
  final controllerCity = TextEditingController();
  // final controllerFood = TextEditingController();

  String? selectedCity;
  String? selectedFood;
  static List<String> getSuggestions(String query) =>
      List.of(cities).where((city) {
        final cityLower = city.toLowerCase();
        final queryLower = query.toLowerCase();

        return cityLower.contains(queryLower);
      }).toList();
  var scaffoldFirsrKey = new GlobalKey<ScaffoldState>();
  bool sizeicon4 = true;
  bool sizeicon1 = true;
  bool sizeicon2 = false;
  bool sizeicon3 = true;
  @override
  void dispose() {
    controllerCity.dispose();
    widget.nameA.dispose();
    widget.nameE.dispose();
    widget.iamge.dispose();
    widget.address.dispose();
    widget.isActive.dispose();
    widget.userInitiate.dispose();
    widget.phones.dispose();
    widget.governorate.dispose();
    widget.city.dispose();
    widget.maintenancephone.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldFirsrKey,
        body: Theme(
          data: HotelAppTheme.buildLightTheme(),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  text(userId.toString()),
                  Wrap(
                    children: [],
                  ),
                  buildCardAppbar(
                    "assets/runner.png",
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Column(
                          children: [
                            buildTextFormFieldArabic(
                              widget.nameA,
                              "اخل اسم الشبكة باللغةالعربية",
                              'شبكة: ',
                              "ادخل اسم الشبكة باللغة العربية",
                              "يجب ادخال اسم الشبكة باللغة العربية",
                              IconButton(
                                onPressed: () {},
                                icon: sizeicon1
                                    ? IconButton(
                                        icon: Icon(Icons.wifi),
                                        onPressed: () {})
                                    : IconButton(
                                        icon: Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {});
                                        },
                                      ),
                              ),
                              TextInputType.name,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            buildTextFormFieldEnglish(
                              widget.nameE,
                              "اخل اسم الشبكة باللغة الانجليزية",
                              'شبكة: ',
                              " ادخل اسم الشبكة باللغة الانجليزية",
                              "يجب ادخال اسم الشبكة باللغة الانجليزية",
                              IconButton(
                                onPressed: () {},
                                icon: errorlanguage
                                    ? IconButton(
                                        icon: Icon(Icons.wifi),
                                        onPressed: () {})
                                    : IconButton(
                                        icon: Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {});
                                        },
                                      ),
                              ),
                              TextInputType.name,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: TypeAheadFormField<
                                                Governorate?>(
                                          hideSuggestionsOnKeyboardHide: false,
                                          textFieldConfiguration:
                                              TextFieldConfiguration(
                                                  controller:
                                                      widget.governorate,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(5.0),
                                                    focusColor: Colors.orange,
                                                    hoverColor: Colors.red,
                                                    errorStyle: const TextStyle(
                                                      color: Colors.red,
                                                      height: 1,
                                                    ),
                                                    prefixIcon: const Icon(
                                                        Icons.location_city),
                                                    hintStyle: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14.0,
                                                      fontFamily:
                                                          StyleWidget.fontName,
                                                    ),
                                                    labelText: ' اسم المحافظة',
                                                    labelStyle: const TextStyle(
                                                        color: const Color(
                                                            0xFF727072),
                                                        height: 1,
                                                        fontSize: 17),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white70,
                                                  )),
                                          noItemsFoundBuilder: (context) =>
                                              Container(
                                            height: 50,
                                            child: Center(
                                                child: ts(
                                              '!! لا توجد هذه المحافظة',
                                              const TextStyle(fontSize: 15),
                                            )),
                                          ),
                                          suggestionsCallback:
                                              Governorates.getGovernorate,
                                          itemBuilder: (context,
                                              Governorate? suggestion) {
                                            final user = suggestion!;

                                            return ListTile(
                                                title: text(user.governorate));
                                          },
                                          onSuggestionSelected:
                                              (Governorate? suggestion) {
                                            widget.governorate.text =
                                                suggestion!.governorate
                                                    .toString();
                                          },
                                          validator: (value) =>
                                              value != null && value.isEmpty
                                                  ? 'يجب ادخال اسم المحافضة'
                                                  : null,
                                          onSaved: (value) =>
                                              widget.governorate.text = value!,
                                        )),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                              child: Container(
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.blue,
                                          controller: widget.city,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(5.0),
                                              hintText: "",
                                              focusColor: Colors.orange,
                                              hoverColor: Colors.red,
                                              errorStyle: const TextStyle(
                                                color: Colors.red,
                                                height: 1,
                                              ),
                                              prefixText: '',
                                              prefixStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                              ),
                                              prefixIcon: IconButton(
                                                onPressed: () {},
                                                icon: Image.asset(
                                                  'assets/placeholder.png',
                                                  color: Colors.black,
                                                  height: 30,
                                                  width: 25,
                                                ),
                                              ),
                                              hintStyle: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.0,
                                              ),
                                              labelText: "  اسم المدينة",
                                              labelStyle: const TextStyle(
                                                  color:
                                                      const Color(0xFF727072),
                                                  height: 1,
                                                  fontSize: 17),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white70),
                                          expands: false,
                                          onSaved: (value) => name = value!,
                                          validator: (name) {
                                            if (name!.isEmpty) {
                                              return ("يجب ادخال اسم المدينة");
                                            }
                                            return null;
                                          },
                                        ),
                                      ))),
                                    ]),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: buildTextFormField(
                                            widget.address,
                                            "",
                                            '',
                                            "  اسم العزلة",
                                            "يجب ادخال اسم العزلة",
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.add_location_outlined),
                                            ),
                                            TextInputType.emailAddress,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 18,
                                      ),
                                      Container(
                                        child: Expanded(
                                          child: SizedBox(
                                              child:
                                                  buildTextFormFieldcontroller(
                                            widget.maintenancephone,
                                            "",
                                            '',
                                            "الدعم الفني",
                                            "يجب ادخال  الرقم",
                                            sizeicon
                                                ? SizedBox()
                                                : IconButton(
                                                    icon: const Icon(Icons.add),
                                                    onPressed: () {
                                                      sizeicon2 = true;
                                                      sizeicon3 = false;
                                                      setState(() {});
                                                    }),
                                            sizeicon
                                                ? IconButton(
                                                    icon: Icon(
                                                        Icons.phone_rounded),
                                                    onPressed: () {})
                                                : SizedBox(),
                                            TextInputType.phone,
                                          )),
                                        ),
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 8,
                                ),
                                sizeicon2
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, right: 185),
                                        child: Container(
                                            child: SizedBox(
                                          child: buildTextFormFieldcontroller(
                                            widget.maintenancephone1,
                                            "",
                                            '',
                                            "اضافة رقم اَخر",
                                            "يجب ادخال الرقم",
                                            sizeicon3
                                                ? IconButton(
                                                    icon: const Icon(Icons.add),
                                                    onPressed: () {},
                                                  )
                                                : SizedBox(),
                                            IconButton(
                                                icon: const Icon(
                                                    Icons.ac_unit_rounded),
                                                onPressed: () {
                                                  setState(() {});
                                                }),
                                            TextInputType.phone,
                                          ),
                                        )),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: ProcessTimelinePage()),
                  TextButton(
                      onPressed: () {},
                      child: RaisedButtons(
                        color: Colors.blue,
                        onPressed: () {
                          submit();
                        },
                        child: ts(
                            'التالي',
                            const TextStyle(
                                color: Colors.white,
                                fontFamily: StyleWidget.fontName)),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  submit() async {
    FocusScope.of(context).unfocus();
    final isValid = _formkey.currentState!.validate();
    if (_file == null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
            backgroundColor: Colors.deepOrange,
            behavior: SnackBarBehavior.fixed,
            content: ts(
              'يجب وضع شعار الشبكة',
              const TextStyle(fontFamily: StyleWidget.fontName),
            )));
      return;
    } else {}
    if (isValid) {
      _formkey.currentState!.save();

      net.postCreatNetwork(
          widget.nameA.text.trim(),
          widget.nameE.text.trim(),
          _file!.path,
          widget.address.text.trim(),
          userId,
          userId,
          widget.governorate.text,
          widget.city.text.trim(),
          widget.maintenancephone.text.trim());

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen()),
        (Route<dynamic> route) => false,
      );
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => SecondScreen()));
    }

    // sizeicon
    //  ? setState(() {
    //   processIndex =
    //   (processIndex + 1) % processes.length;})
    //    : setState(() {});
  }

  Column buildColumnGradView(
      Widget buildTextFormField1, Widget buildTextFormField2) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Container(
              child: buildTextFormField1,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Expanded(
            child: SizedBox(
              child: Container(
                child: buildTextFormField2,
              ),
            ),
          ),
        ]),
      ],
    );
  }

  buildTextFormField(
    TextEditingController controller,
    String hintText,
    String prefixText,
    String labelText,
    String errore1,
    IconButton icon,
    TextInputType number,
  ) {
    return TextFormField(
      keyboardType: number,
      cursorColor: Colors.blue,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          hintText: hintText,
          focusColor: Colors.orange,
          hoverColor: Colors.red,
          errorStyle: const TextStyle(
            color: Colors.red,
            height: 1,
          ),
          prefixText: prefixText,
          prefixStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
          prefixIcon: icon,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFF727072),
            height: 1,
            fontSize: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Colors.white70),
      expands: false,
      onSaved: (value) => name = value!,
      validator: (name) {
        if (name!.isEmpty) {
          return (errore1);
        }
        return null;
      },
    );
  }

  //for language Arabic
  buildTextFormFieldArabic(
    TextEditingController controller,
    String hintText,
    String prefixText,
    String labelText,
    String errore,
    IconButton icon,
    TextInputType number,
  ) {
    return TextFormField(
      keyboardType: number,
      cursorColor: Colors.blue,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          hintText: hintText,
          focusColor: Colors.orange,
          hoverColor: Colors.red,
          errorStyle: const TextStyle(
            color: Colors.red,
            height: 1,
          ),
          prefixText: prefixText,
          prefixStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
          prefixIcon: icon,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFF727072),
            height: 1,
            fontSize: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: BorderRadius.circular(25.7),
          ),
          filled: true,
          fillColor: Colors.white70),
      onChanged: (String value) async {
        final Arabic = RegExp(
            ('^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa]'));
        if (widget.nameA.text.trimRight().length < 20 &&
            widget.nameA.text.trimRight().startsWith(RegExp(r'^[a-zA-Z]$'))) {
          setState(() {
            color = Colors.red;
          });
        } else if (widget.nameA.text.trimRight().length < 20 &&
            widget.nameA.text.trimRight().startsWith(Arabic)) {
          setState(() {
            color = Colors.green;
            sizeicon1 = false;
          });
        } else if (widget.nameA.text.trim().length == 0 &&
            widget.nameA.text.trim().isEmpty) {
          setState(() {
            sizeicon1 = true;

            color = Colors.grey;
            widget.nameA.text.trim();
          });
        } else {
          widget.nameA.text.trim();
          sizeicon1 = true;
          color = Colors.grey;
        }
      },
      expands: false,
      onSaved: (value) => myTask = value!,
      validator: (name) {
        if (name!.isEmpty) {
          sizeicon1 = true;
          return (errore);
        }
        return null;
      },
    );
  }

  //for language Einglish
  buildTextFormFieldEnglish(
    TextEditingController controller,
    String hintText,
    String prefixText,
    String labelText,
    String errore,
    IconButton icon,
    TextInputType number,
  ) {
    return TextFormField(
      keyboardType: number,
      cursorColor: Colors.blue,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          hintText: hintText,
          focusColor: Colors.orange,
          hoverColor: Colors.red,
          errorStyle: const TextStyle(
            color: Colors.red,
            height: 1,
          ),
          prefixText: prefixText,
          prefixStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
          prefixIcon: icon,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFF727072),
            height: 1,
            fontSize: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color1),
            borderRadius: BorderRadius.circular(25.7),
          ),
          filled: true,
          fillColor: Colors.white70),
      onChanged: (String value) async {
        final English = RegExp(r'^[a-z-zA-Z]$');
        if (widget.nameE.text.trimRight().length < 20 &&
            widget.nameE.text.trimRight().startsWith(RegExp(
                '^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa_]'))) {
          setState(() {
            color1 = Colors.red;
          });
        } else if (widget.nameE.text.trimRight().length < 20 &&
            widget.nameE.text.trimRight().startsWith(English)) {
          setState(() {
            errorlanguage = false;
            color1 = Colors.green;
          });
        } else if (widget.nameE.text.trim().length == 0 &&
            widget.nameE.text.trim().isEmpty) {
          setState(() {
            errorlanguage = true;

            color1 = Colors.grey;
            widget.nameE.text.trim();
          });
        } else {
          widget.nameE.text.trim();
          errorlanguage = true;
          color1 = Colors.grey;
        }
      },
      expands: false,
      onSaved: (value) => myTask = value!,
      validator: (name) {
        if (name!.isEmpty) {
          return (errore);
        }
        return null;
      },
    );
  }

  //This is TextFormField for controller writing the user
  buildTextFormFieldcontroller(
    TextEditingController controller,
    String hintText,
    String prefixText,
    String labelText,
    String error,
    Widget suffixIcon,
    Widget icon,
    TextInputType number,
  ) {
    return TextFormField(
      keyboardType: number,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.all(5),
          hintText: hintText,
          prefixText: prefixText,
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          prefixStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
          prefixIcon: icon,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14.0,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFF727072),
            height: 1,
            fontSize: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          filled: true,
          fillColor: Colors.white70),
      onChanged: (String value) async {
        if (widget.maintenancephone.text.length < 11 &&
            widget.maintenancephone.text.startsWith(new RegExp("^[0-9]"))) {
          setState(() {
            sizeicon = false;
          });
        } else if (widget.maintenancephone.text.length < 1 &&
            widget.maintenancephone.text.isEmpty) {
          setState(() {
            sizeicon = true;
            sizeicon2 = false;
          });
        } else {
          sizeicon = true;
          sizeicon3 = true;
        }
      },
      expands: false,
      onSaved: (value) => myTask = value!,
      validator: (name) {
        if (name!.isEmpty) {
          return (error);
        }
        return null;
      },
    );
  }

  //This is Autocomplete TextFeild
  Widget buildCity() => TypeAheadFormField<String?>(
        textFieldConfiguration: TextFieldConfiguration(
          controller: controllerCity,
          decoration: InputDecoration(
            labelText: 'City',
            border: OutlineInputBorder(),
          ),
        ),
        suggestionsCallback: getSuggestions,
        itemBuilder: (context, String? suggestion) => ListTile(
          title: Text(suggestion!),
        ),
        onSuggestionSelected: (String? suggestion) =>
            controllerCity.text = suggestion!,
        validator: (value) =>
            value != null && value.isEmpty ? 'Please select a city' : null,
        onSaved: (value) => selectedCity = value,
      );
  Padding buildCardAppbar(String image) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, top: 0, bottom: 0),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Stack(
                                overflow: Overflow.visible,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, top: 2),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: _file != null
                                          ? FileImage(_file!)
                                          : null,
                                    ),
                                  ),
                                  Positioned(
                                    top: 45,
                                    left: 40,
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    top: 31,
                                    left: 26,
                                    child: IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () async {
                                          // if (picketimage == null) {
                                          //   Scaffold.of(context).showSnackBar(
                                          //       SnackBar(
                                          //           content: text(
                                          //               'من فضلك اضف صوره')));
                                          // }

                                          picketimage.call();
                                        }),
                                  ),
                                ],
                              )),
                          ts(
                            "خدمات الشبكات الاسلكية",
                            const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: StyleWidget.fontName,
                              letterSpacing: 0.0,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 100,
                            bottom: 12,
                            top: 4,
                            right: 16,
                          ),
                          child: ts(
                            "اضف صورة الشبكة الخاصة بك",
                            TextStyle(
                              fontFamily: StyleWidget.fontName,
                              fontWeight: FontWeight.w800,
                              fontSize: 10,
                              letterSpacing: 0.0,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -16,
            left: 0,
            child: SizedBox(
                width: 110,
                height: 110,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}

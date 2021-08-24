import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../.././Api/Manager/Models/Package.dart';
import '../../../../.././Api/Manager/Repositorys/Network.dart';
import '../../../../.././Api/Manager/Repositorys/Package.dart';
import '../../../../.././Api/Manager/Repositorys/User.dart';
import '../../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../../.././UI/Manager/widget/functions_public/functions.dart';
import '../../../../.././UI/Manager/widget/style_app/AppStyleModeNotifier.dart';
import '../../../../.././UI/Manager/widget/style_app/Them.dart';
import 'package:provider/provider.dart';
import '../../../../.././UI/Manager/widget/widget_public.dart';
import 'package:http/http.dart' as http;

var namepackage;

class AddCards extends StatefulWidget {
  @override
  _AddCardsState createState() => _AddCardsState();
}

class _AddCardsState extends State<AddCards> {
  String pricecards = '';
  bool tetxccsacfulySavedata = false;
  bool tetxccsacfulySavedata1 = false;
  bool tetxccsacfulySavedata2 = false;
  bool validatdata = true;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController addCards = TextEditingController();
  final TextEditingController addCards1 = TextEditingController();
  Future<List<PackagePriceId>?> fetchData =
      packageApi.getPackagePrice(networkId);

  var selectedCurrency, selectedType;
  @override
  void dispose() {
    addCards.dispose();
    addCards1.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final PackagePriceId packagePriceId;
    networkId.toString(); //This is Network id
    var theme = Theme.of(context);
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: ts(
                'اضافة الكروت الى الفئات',
                TextStyle(
                    color: appStyleMode.White,
                    fontFamily: 'Cairo',
                    fontSize: 15),
              ),
            ),
            body:
            Theme(
                    data: HotelAppTheme.buildLightTheme(),child: Form(
              key: _formkey,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                 
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Center(
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(children: [
                                          Card(
                                            elevation: 5,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 18, right: 18),
                                              child: Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: FutureBuilder(
                                                    future:
                                                        fetchData,
                                                    builder: (context,
                                                        AsyncSnapshot
                                                            snapshot) {
                                                      if (!snapshot.hasData) {
                                                        return buildCircularProgressIndicator();
                                                      } else if (snapshot
                                                              .data.length ==
                                                          0) {
                                                        return buildNoTasks(
                                                          theme,
                                                          'لا توجد بيانات',
                                                        );
                                                      } else {
                                                        List<DropdownMenuItem<String>>
                                                            currencyItems = [];
                                                        for (int i = 0;
                                                            i <
                                                                snapshot.data
                                                                    .length;
                                                            i++) {
                                                          var snap =
                                                              snapshot.data[i];

                                                          currencyItems.add(
                                                            DropdownMenuItem<String>(
                                                              child: ts(
                                                                ' ${snap.packagePrice} ريال',
                                                                const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: const Color(
                                                                        0xFF09140A)),
                                                              ),
                                                              value:
                                                                  "${snap.id}",
                                                            ),
                                                          );
                                                        }
                                                        return Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Directionality(
                                                              textDirection:
                                                                  TextDirection
                                                                      .rtl,
                                                              child:
                                                                  DropdownButton<
                                                                      String>(
                                                                dropdownColor:
                                                                    Colors
                                                                        .white,
                                                                items:
                                                                    currencyItems,
                                                                onChanged:
                                                                    (currencyValue) {
                                                                  pricecards =
                                                                      ' ${currencyValue.toString()}';

                                                                  setState(() {
                                                                    selectedCurrency =
                                                                        currencyValue;
                                                                  });
                                                                  getPackagePrice() async {
                                                                    var baseURL =
                                                                        Uri.parse(
                                                                            '$uri/package/Packageprice/$currencyValue');
                                                                    print(
                                                                        '${baseURL}');
                                                                    try {
                                                                      var response =
                                                                          await http
                                                                              .get(
                                                                        baseURL,
                                                                        headers:
                                                                            headers,
                                                                      );
                                                                      List
                                                                          list =
                                                                          jsonDecode(
                                                                              response.body);
                                                                      late final users = list
                                                                          .map((model) =>
                                                                              PackagePriceId.fromJson(model))
                                                                          .toList();
                                                                      print(users
                                                                          .length);
                                                                      return users
                                                                          .forEach(
                                                                              (post) {
                                                                        namepackage =post.packagePrice;
                                                                      });
                                                                    } catch (e) {
                                                                      print(
                                                                          "${e.toString()}هناك خطاء");
                                                                    }
                                                                    return null;
                                                                  }

                                                                  getPackagePrice();
                                                                },
                                                                value:
                                                                    selectedCurrency,
                                                                isExpanded:
                                                                    false,
                                                                hint: ts(
                                                                  "اسم الفئة ",
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color:
                                                                          const Color(
                                                                        0xFF0F130F,
                                                                      )),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ]),
                                        InkWell(
                                          onTap: () {
                                            if (selectedCurrency == null) {
                                              AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.ERROR,
                                                animType: AnimType.RIGHSLIDE,
                                                headerAnimationLoop: false,
                                                title: " (حدد اسم الفئة)",
                                                desc:
                                                    '.يجب تحديد اسم الفئة التي تريد اضافة الملف اليها',
                                                btnOkOnPress: () {
                                                  setState(() {});
                                                },
                                                btnOkText: 'موافق',
                                                btnCancelText: 'الغاء',
                                                btnCancelOnPress: () {},
                                                btnOkColor: Colors.red,
                                              )..show();
                                            } else {
                                              chooseFileUsingFilePicker(
                                                  namepackage);
                                            }
                                          },
                                          child: Column(children: [
                                            Card(
                                              elevation: 5,
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 8,
                                                      right: 8,
                                                      top: 10,
                                                      bottom: 10),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.add),
                                                      ts(
                                                        'ادخال ملف   CSV',
                                                        const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ]),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  child: buildTextFormField(
                                    addCards,
                                    "     ادخل رقم الكرت",
                                    " يجب ادخال  رقم الكرت",
                                    TextInputType.number,
                                  ),
                                ),
                              ),
                            ]),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  child: buildTextFormField(
                                    addCards1,
                                    "     ادخل كلمة المرور",
                                    "يجب ادخل كلمة المرور",
                                    TextInputType.number,
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 120,
                        ),
                        tetxccsacfulySavedata1
                            ? Wrap(
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: 'تم طباعة ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: [
                                        TextSpan(
                                            text: '${addCards.text.toString()}',
                                            style: TextStyle(
                                              color: Colors.blue,
                                            )),
                                        // TextSpan(
                                        //   text: 
                                        //       ' الى الفئة :${selectedCurrency.toString()} ',
                                        // ),
                                        TextSpan(
                                          text: 'بنجاح',
                                        )
                                      ])),
                                  Icon(Icons.sentiment_satisfied_alt_sharp,
                                      size: 35, color: Colors.green),
                                ],
                              )
                            : SizedBox(),
                        tetxccsacfulySavedata2
                            ? Row(
                                children: [
                                  ts(
                                      'تم حفظ الملف  بنجاح . ',
                                      const TextStyle(
                                        color: Colors.green,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Icon(Icons.sentiment_satisfied_alt_sharp,
                                      size: 30, color: Colors.green),
                                ],
                              )
                            : SizedBox(),
                        tetxccsacfulySavedata
                            ? Row(
                                children: [
                                  ts(
                                      'تم إدخال ملف CSV الى الفئة :${pricecards.toString()} بنجاح ',
                                      const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Icon(Icons.sentiment_satisfied_alt_sharp,
                                      size: 35, color: Colors.green),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 50,
                        ),
                        TextButton(
                          child: RaisedButtons(
                            onPressed: () {
                              setState(() {
                                if (tetxccsacfulySavedata == true) {
                                  tetxccsacfulySavedata2 = true;
                                  tetxccsacfulySavedata = false;
                                  tetxccsacfulySavedata1 = false;
                                } else if (tetxccsacfulySavedata2 = false) {
                                  tetxccsacfulySavedata1 = true;
                                }

                                if (selectedCurrency == null) {
                                  tetxccsacfulySavedata1 = false;
                                  tetxccsacfulySavedata = false;
                                }
                              });

                              if (validatdata
                                  ? _formkey.currentState!.validate() &&
                                      tetxccsacfulySavedata1 == false
                                  : tetxccsacfulySavedata) {
                                if (tetxccsacfulySavedata == false) {
                                  tetxccsacfulySavedata1 = true;
                                }
                              } else {
                                tetxccsacfulySavedata1 = false;
                                addCards.clear();
                                addCards1.clear();
                              }
                            },
                            color: appStyleMode.Blueandgrey,
                            child: ts(
                                ' حفظ  ',
                                TextStyle(
                                    color: appStyleMode.White,
                                    fontFamily: 'Cairo')),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )),
            )));
  }

  // This is for get File csv

  late String _fileName = '...';
  late String _path = '...';
  late List<String> _extension;
  bool _hasValidMime = false;
  // late FileType _pickingType;

  buildTextFormField(
    TextEditingController controller,
    String labelText,
    String errore1,
    TextInputType number,
  ) {
    return TextFormField(
      keyboardType: number,
      cursorColor: Colors.blue,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          focusColor: Colors.orange,
          hoverColor: Colors.red,
          errorStyle: const TextStyle(
            color: Colors.red,
            height: 1,
          ),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
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

  PlatformFile? objFile;

  void chooseFileUsingFilePicker(mealsListData) async {
    print('${selectedType}اسيابكسايبسب');
    var result = await FilePicker.platform.pickFiles(
      withReadStream: true,
    );
    if (result != null) {
      setState(() {
        objFile = result.files.single;
        objFile != null
            ? builddilog(context, mealsListData).toString()
            // ignore: unnecessary_statements
            : '...';
      });
    }
  }

  void uploadSelectedFile(
    String packageId,
  ) async {
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("$uri/csv/uploadfile"),
    );

    request.fields["id"] = "abc";
    request.fields.addAll({
      "PackageId": packageId,
    });
    request.files.add(new http.MultipartFile(
        "uploadfile", objFile!.readStream!, objFile!.size!,
        filename: objFile!.name));
    var resp = await request.send();
    final responsedata = json.decode(await resp.stream.bytesToString());
    print(responsedata);
    var countData = responsedata['count data'];
    print(countData);
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            "تم اظافة : ${countData.toString()} كرت الى الفئة:${namepackage.toString()}  بنجاح  ",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ));
  }

  builddilog(BuildContext context, package) {
    showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            actions: [
              Center(
                  child: Text(
                '${namepackage.toString()}: هل متاكد من اضافة هذا الملف الى باقة',
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.deepOrange,
                ),
                textAlign: TextAlign.center,
              )),
              const Text(': رابط المسار ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Cairo', fontWeight: FontWeight.bold)),
              Text(
                (objFile != null ? objFile!.path : '')!,
                style:
                    TextStyle(fontFamily: 'Cairo', color: Colors.blue.shade900),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              const Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  'اسم الملف',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
              new Text(
                objFile!.path!.split('/').last,
                style:
                    TextStyle(fontFamily: 'Cairo', color: Colors.blue.shade900),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    color: Colors.blue[100],
                    child: ts(
                      "الغاء",
                      const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Cairo',
                        letterSpacing: 0.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    color: Colors.green,
                    child: ts(
                      "موافق",
                      const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        fontFamily: 'Cairo',
                        letterSpacing: 0.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () async {
                      print('do');
                      uploadSelectedFile(
                        selectedCurrency,
                      );
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }
  // builddilog(BuildContext context,packagePriceId  ) {
  //   showDialog<void>(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           backgroundColor: Colors.white,
  //           actions: [
  //             Center(
  //               child: ts(
  //                   '  ${pricecards.toString()}: الفئة المحددة  ',
  //                   TextStyle(
  //                     color: Colors.orangeAccent.shade700,
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 17,
  //                   )),
  //             ),
  //             const Text(':رابط المسار ',
  //                 textAlign: TextAlign.center,
  //                 style: const TextStyle(
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 17,
  //                 )),
  //             Text(
  //               (objFile != null ? objFile!.path : '')!,
  //               style:
  //                   TextStyle(fontFamily: 'Cairo', color: Colors.blue.shade900),
  //               textAlign: TextAlign.center,
  //               softWrap: true,
  //             ),
  //             const Padding(
  //               padding: const EdgeInsets.only(top: 10.0),
  //               child: const Text(
  //                 ' :اسم الملف',
  //                 textAlign: TextAlign.center,
  //                 style: const TextStyle(
  //                   fontWeight: FontWeight.w600,
  //                   fontSize: 17,
  //                 ),
  //               ),
  //             ),
  //             new Text(
  //               objFile!.name!,
  //               style:
  //                   TextStyle(fontFamily: 'Cairo', color: Colors.blue.shade900),
  //               textAlign: TextAlign.center,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 FlatButton(
  //                   color: Colors.blue[100],
  //                   child: ts(
  //                     "الغاء",
  //                     const TextStyle(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 12,
  //                       fontFamily: 'Cairo',
  //                       letterSpacing: 0.0,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //                 FlatButton(
  //                   color: Colors.green,
  //                   child: ts(
  //                     "موافق",
  //                     const TextStyle(
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 12,
  //                       fontFamily: 'Cairo',
  //                       letterSpacing: 0.0,
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   onPressed: () async {
  //                     setState(() {
  //                       if (tetxccsacfulySavedata1 == true) {
  //                         tetxccsacfulySavedata1 = false;
  //                       }
  //                       if (selectedCurrency == null) {
  //                         tetxccsacfulySavedata1 = false;
  //                         tetxccsacfulySavedata = false;
  //                       } else {
  //                         addCards1.clear();
  //                         addCards.clear();
  //                         validatdata = true;
  //                         tetxccsacfulySavedata = true;
  //                       }
  //                     });

  //                     uploadSelectedFile(datass.id,
  //                         datass.packagePrice);

  //                     // await api.postfilecsv(filecsv);
  //                     Navigator.of(context).pop(tetxccsacfulySavedata);
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ],
  //         );
  //       });
  // }

  //Save file csv To Srever
  // void _openFileExplorer(final String mealsListData) async {
  //   if (_pickingType != FileType.custom || _hasValidMime) {
  //     // try {
  //     //   _path = await FilePicker.getFilePath(
  //     //       type: FileType.any, allowedExtensions: _extension);
  //     // }
  //     try {
  //       _path = (await FilePicker.platform.pickFiles(type: FileType.any,allowedExtensions: _extension)) as String;
  //
  //       // getFilePath(
  //       //     type: FileType.any, allowedExtensions: _extension);
  //     }
  //
  //     on PlatformException catch (e) {
  //       print("Unsupported operation" + e.toString());
  //     }
  //
  //     if (!mounted) return;
  //
  //     setState(() {
  //       _fileName = _path != null ? builddilog(context, mealsListData) : '...';
  //     });
  //   }
  // }
}

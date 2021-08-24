import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../.././Api/Client/Models_Client/Network.dart';
import '../../../.././Api/Client/Repositorys_Client/Network.dart';
import '../../../.././UI/Manager/widget/Pages/Second_Screen/SecondScreen.dart';
import '../../../.././UI/Manager/widget/functions_public/functions.dart';

class TheNetwork extends StatefulWidget {
  @override
  _TheNetworkState createState() => _TheNetworkState();
}

class _TheNetworkState extends State<TheNetwork> {
  @override
  Widget build(BuildContext context) {
    String? widgetchild;
    Future<List<Network>?> fetchData = networkClientApi.getAllNetwork();
    return Scaffold(
        body: FutureBuilder(
            future: fetchData,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return buildCircularProgressIndicator();
              } else if (snapshot.data.length == 0) {
                var theme = Theme.of(context);
                return buildNoTasks(
                  theme,
                  'لا توجد بيانات',
                );
              } else {
                return ListView.builder(
                    shrinkWrap: false,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data[index];
                      data.allcaverageErea.forEach((item) {
                        // print(item.allcaverageErea);
                        widgetchild = item.allcaverageErea;
                        print(widgetchild);
                      });

                      return Column(
                        children: [
                          // for (var widgetchild = 0; i < 10; i++) Text('Item $i'),
                        ],
                      );
                      //
                      // Center(
                      //     child: SingleChildScrollView(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       // NETNamr(
                      //       //   network: data,
                      //       // )
                      //       // Text(data.nameA.toString()),
                      //       // Text(data.coverageArea[index].address.toString()),
                      //       // Text(data.packages[index].packageData.toString()),
                      //       // Text(data.allcaverageErea[index].allcaverageErea
                      //       //     .toString()),
                      //       Text('${widgetchild!.indexOf('جديده')}')
                      //       // Text('kshk')
                      //     ],
                      //   ),
                      // ));
                    });
              }
            }));
  }
}

class NETNamr extends StatefulWidget {
  final Network network;

  const NETNamr({Key? key, required this.network}) : super(key: key);
  @override
  _NETNamrState createState() => _NETNamrState(network);
}

class _NETNamrState extends State<NETNamr> {
  final Network network;
  late int index = 0;
  _NETNamrState(this.network);
  @override
  Widget build(BuildContext context) {
    return Text(network.allcaverageErea[index].allcaverageErea.toString());
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wirless_wifi/Api/Manager/Repositorys/Cards.dart';

import 'Pages/Second_Screen/SecondScreen.dart';
import 'functions_public/functions.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    Future<dynamic>? fetchTask = Cardsapi.getCards();
    var theme = Theme.of(context);
    return Scaffold(
        body: Center(
            child: StreamBuilder(
                stream: fetchTask!.asStream(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return buildCircularProgressIndicator();
                  } else if (snapshot.data.length == 0) {
                    return buildNoTasks(theme, 'لا توجد بيانات');
                  } else {
                    return Center(
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = snapshot.data[index];
                             
                            return 
                            Center(
                                child: Text(data.username.toString())
                                );
                          }),
                    );
                  }
                })));
  }
}

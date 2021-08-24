import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SelectedLocation extends StatefulWidget {
  @override
  _SelectedLocationState createState() => _SelectedLocationState();
}

class _SelectedLocationState extends State<SelectedLocation> {
  late Position cl;
  Future getpostion() async {
    bool serverss;
    LocationPermission per;

    serverss = await Geolocator.isLocationServiceEnabled();
    if (serverss == false) {}
    print(serverss.toString());
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        getLatAndLang();
      }
    }

    print(per);
  }

  Future<Position> getLatAndLang() async {
    setState(() {});
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  @override
  void initState() {
    super.initState();
    getpostion();
    //  getpostion();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () async {
              cl = await getLatAndLang();
              print(cl.latitude);
              print(cl.longitude);
              
              List<Placemark> placemarks =
                  await placemarkFromCoordinates(
                    // 14.887592,43.474088
                    cl.latitude, cl.longitude
                    
                    
                    );
              print(placemarks[0].administrativeArea!);
              String gg = (placemarks[0].street!);
              List<String> result = gg.split(' ،');
              var resultloaction = result[0].split('،');
              print(resultloaction[1]);
              print(resultloaction[0]);
            },
            child: Text('selscte location '),
          ),
        ],
      )),
    );
  }
}

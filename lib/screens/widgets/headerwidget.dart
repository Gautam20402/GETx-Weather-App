import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/global_controller.dart';


class header extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return headerstate();
  }
}


class headerstate extends State<header>{
  String city = '';

  String date = DateFormat("yMMMMd").format(DateTime.now());

  final Globalcontroller globalcontroller =
  Get.put(Globalcontroller(), permanent: true);

  @override

  void initState(){
    getaddress(
      globalcontroller.getlattitude().value,
      globalcontroller.getlongitude().value,
    );
    super.initState();
  }


  getaddress(lat,lon)async{
    List<Placemark> placemark = await
    placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left:20,right:20),
          alignment: Alignment.topLeft,
          child: Text(city,
          style: TextStyle(
            fontSize: 40,
            height: 2
          ),),
        ),
        Container(
          margin: EdgeInsets.only(left:20,right:20,bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(date,
            style: TextStyle(
                fontSize: 20,
              color: Colors.grey,
              height: 1.5
            ),),
        ),
      ],
    );
  }
}

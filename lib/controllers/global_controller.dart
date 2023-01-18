
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/API/fetch_api.dart';
import 'package:weather_app/models/weather_data.dart';


class Globalcontroller extends GetxController{

  final RxBool isloading = true.obs;
  final RxDouble lattitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final RxInt currentindex = 0.obs;

  RxBool checkloading() => isloading;
  RxDouble getlattitude() => lattitude;
  RxDouble getlongitude() => longitude;

  final weatherdata = Weatherdata().obs;

  RxInt getindex(){
    return currentindex;
  }


  Weatherdata getdata(){
    return weatherdata.value;
  }

  @override
  void onInit(){
    if(isloading.isTrue){
      getlocation();
    }else{
      getindex();
    }
    super.onInit();
  }

  getlocation() async{
    bool isserviceenabled;
    LocationPermission locationPermission;


    isserviceenabled = await Geolocator.isLocationServiceEnabled();
    if(!isserviceenabled){
      return Future.error('Location not enabled');
    }

    locationPermission = await Geolocator.checkPermission();
    if(locationPermission == LocationPermission.deniedForever){
      return Future.error('Location Permission Denied');
    }
    else if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        return Future.error('Location Permission Denied');
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    ).then((value){
      lattitude.value = value.latitude;
      longitude.value = value.longitude;

      return Fetchapi().
      processdata(value.latitude, value.longitude)
      .then((value){
        weatherdata.value=value;
        isloading.value = false;
      });
    });
  }
}


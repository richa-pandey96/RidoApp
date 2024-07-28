import 'package:flutter/cupertino.dart';
import 'package:rider_app/models/directions.dart';
//import 'package:ri/models/directions.dart';



class AppInfo extends ChangeNotifier{
  Directions?userPickUpLocation,userDropOffLocation;
  int countTotalTrips=0;

  void updatePickUpLocationAddress(Directions userPickUpAddress){
    userPickUpLocation=userPickUpAddress;
    notifyListeners();
  }
  void userDropOffLocationAddress(Directions dropOffaddress){
    userDropOffLocation=dropOffaddress;
    notifyListeners();
  }
}
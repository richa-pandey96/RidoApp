import 'package:firebase_database/firebase_database.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/Assistants/request_assistant.dart';
import 'package:rider_app/global/global.dart';
import 'package:rider_app/global/map_key.dart';
import 'package:rider_app/infohandler/app_info.dart';
import 'package:rider_app/models/directions.dart';
import 'package:rider_app/models/user_model.dart';


class AssistantMethods{

  static void readCurrentOnlineUserInfo() async {
    currentUser=firebaseAuth.currentUser;
    DatabaseReference userRef=FirebaseDatabase.instance
      .ref()
      .child("users")
      .child(currentUser!.uid);

      userRef.once().then((snap){
        if(snap.snapshot.value!=null){
          userModelCurrentInfo=UserModel.fromSnapshot(snap.snapshot);

        }
      });
  }
  static Future<String> searchAddressForGeographicCoOrdinates(Position position, context)async{
    String apiUrl="https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";
    String humanReadableAddress="";

    var requestResponse=await RequestAssistant.receiveRequest(apiUrl);

    if(requestResponse!="Error Occured.Failed.No response"){
      humanReadableAddress=requestResponse["results"][0]["formatted_address"];

      Directions userPickUpAddress=Directions();
      userPickUpAddress.locationLatitude=position.latitude;
      userPickUpAddress.locationLongitude=position.longitude;
      userPickUpAddress.locationName=humanReadableAddress;

      Provider.of<AppInfo>(context, listen:false).updatePickUpLocationAddress(userPickUpAddress);

    }

    return humanReadableAddress;
  }
}
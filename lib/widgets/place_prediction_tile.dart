import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/Assistants/request_assistant.dart';
import 'package:rider_app/global/map_key.dart';
import 'package:rider_app/infohandler/app_info.dart';
import 'package:rider_app/models/directions.dart';
import 'package:rider_app/models/predicted_places.dart';
import 'package:rider_app/widgets/progress_dialog.dart';

class _PlacePredictionTileDesign extends StatefulWidget {

  final PredictedPlaces?predictedPlaces;
  _PlacePredictionTileDesign({this.predictedPlaces});
  //const _PlacePredictionTileDesign({super.key});

  @override
  State<_PlacePredictionTileDesign> createState() => __PlacePredictionTileDesignState();
}

class __PlacePredictionTileDesignState extends State<_PlacePredictionTileDesign> {
  //bool darkTheme=MediaQuery.of(context).platformBrightness==Brightness.dark;
  getPlaceDirectionDetails(String? placeId,context) async{
    showDialog(context: context, builder: (BuildContext context)=>ProgressDialog(
      message:"Setting up Drop-off. Please wait.....",

    )
    );
    String placeDirectionDetailsUrl="https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey";
    var responseApi=await RequestAssistant.receiveRequest(placeDirectionDetailsUrl);
    Navigator.pop(context);

    if(responseApi=="Error Occurred. Failed. No Response."){
      return;
    }

    if(responseApi["status"]=="OK"){
      Directions directions=Directions();
      directions.locationName=responseApi["result"]["name"];
      directions.locationId=placeId;
      directions.locationLatitude=responseApi["result"]["geometry"]["location"]["lat"];
      directions.locationName=responseApi["result"]["geometry"]["location"]["lng"];

      Provider.of<AppInfo>(context,listen:false).updatePickUpLocationAddress(directions);

      setState(() {
        var userDropOffAddress=directions.locationName!;
        
      });

      Navigator.pop(context,"obtainedDropOff");

    }
  }
  @override
  Widget build(BuildContext context) {

    bool darkTheme=MediaQuery.of(context).platformBrightness==Brightness.dark;
    return ElevatedButton(
      onPressed: () {
        getPlaceDirectionDetails(widget.predictedPlaces!place_id, context);

      },
      style: ElevatedButton.styleFrom(
        backgroundColor: darkTheme?Colors.black:Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.add_location,
              color: darkTheme?Colors.amber.shade400:Colors.blue,
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.predictedPlaces!.main_text!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: darkTheme? Colors.amber.shade400:Colors.blue,
                    ),
                  ),

                  Text(
                    widget.predictedPlaces!.secondary_text!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: darkTheme? Colors.amber.shade400:Colors.blue,
                    ),
                  ),
                ],
              ),

            )
          ],
        ),
      
      ),
    );
  }
}
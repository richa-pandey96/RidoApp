import 'package:flutter/material.dart';

class ProgressDialog extends StatefulWidget {

  String? message;
  ProgressDialog({this.message});

  //@override
  //State<ProgressDialog> createState() => _ProgressDialogState();


//class _ProgressDialogState extends State<ProgressDialog> {
  @override
  Widget build(BuildContext context) {
    var message;
    return Dialog(
      backgroundColor: Colors.black54,
      child: Container(
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(children: [
          SizedBox(width: 6,),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          SizedBox(width: 26.0,),
          Text(
            message!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          )
        ],),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
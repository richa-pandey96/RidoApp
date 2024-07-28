import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestAssistant{
  static get Url => null;

  static Future<dynamic> receiveRequest(String url) async{
    http.Response httpResponse=await http.get(Url.parse(url));

    try{
      if(httpResponse.statusCode==200){
        String responseData=httpResponse.body;
        var decodeResponseData=jsonDecode(responseData);

        return decodeResponseData;


      }
      else{
        return "Error Occured . Failed . No Response.";
      }
    }catch(exp){
      return "Error Occured . Failed . No Response. ";
    }
  }
}
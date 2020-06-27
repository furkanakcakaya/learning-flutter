import 'package:http/http.dart';
import 'dart:convert';


class WorldTime {

  String location;
  String time;
  String flag;
  String url;

  WorldTime({ this.location, this.flag, this.url });



  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      time = now.add(Duration(hours: int.parse(offset))).toString();
    }
    catch(e){
      print('caught error: $e');
      time = 'could not get the time';
    }

  }
}
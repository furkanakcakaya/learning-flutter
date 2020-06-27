import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'de.jpg'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'tr.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'ke.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'sk.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'id.jpg'),
  ];

  void updateTime(index) async {
    WorldTime current = locations[index];
    await current.getTime();
    Navigator.pop(context, {
      'location': current.location,
      'flag': current.flag,
      'time': current.time,
      'isDayTime': current.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

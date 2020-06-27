import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Istanbul', flag: 'assets/flags/turkey.png', url: '/Europe/Istanbul');
    await instance.getTime();
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitChasingDots(
              color: Colors.grey[900],
              size: 100.0,
            ),
            SizedBox(height: 60),
            Text('Loading', style: TextStyle(fontSize: 30)),
            SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}

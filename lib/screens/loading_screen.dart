import 'package:flutter/material.dart';
import '/services/location.dart';
import '/screens/city_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({this.city});

  final city;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {

  Location location = Location();
  var temprature;
  var description;
  var max_temp;
  var min_temp;
  var weatherData = {};

  @override
  initState(){
    super.initState();
    initialize();
  }

  Future <void> initialize() async{
    await fetchLocation();
    await Future.delayed(Duration(seconds: 1));
    await getData();
    navigatetoCityScreen();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  Future<void> fetchLocation() async{
    await location.getLocation();
    print(location.latitude);
    print(location.longitude);
  }

  Future<void> getData() async{
   var data;
    if (widget.city == null) {
      http.Response response = await http.get(Uri.parse(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/${location
              .latitude},${location.longitude}?key=WCEDJAGA5DAZ4D7Q4E8GHGJF7'));
      data = response.body;
    }

    else{
      http.Response response = await http.get(Uri.parse(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/${widget.city}?key=WCEDJAGA5DAZ4D7Q4E8GHGJF7'));
      data = response.body;
    }


   temprature = jsonDecode(data)["days"][0]["temp"];
   description = jsonDecode(data)['days'][0]['description'];
   max_temp = jsonDecode(data)['days'][0]['tempmax'];
   min_temp = jsonDecode(data)['days'][0]['tempmin'];

   weatherData = {'temp': temprature, 'description': description, 'max_temp': max_temp, 'min_temp': min_temp};


  }

  void navigatetoCityScreen() async{
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return CityScreen(data: weatherData, city: widget.city,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.blueAccent[400],)
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'loading_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  final data;
  final String? city;

  CityScreen({this.data, this.city});
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var cityName;
  late String textCity;
  var notUnit = 'F';

  int temp = 0;
  int max_temp = 0;
  int min_temp = 0;


  void initState() {
    super.initState();
    textCity = widget.city ?? 'Your Location';
    temp = widget.data['temp'].toInt();
    max_temp = widget.data['max_temp'].toInt();
    min_temp = widget.data['min_temp'].toInt();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/blue_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          notUnit == 'F' ? notUnit = 'C' : notUnit = 'F';

                          if (notUnit == 'C') {
                            temp = toCenti(widget.data['temp'].toInt());
                            max_temp = toCenti(widget.data['max_temp'].toInt());
                            min_temp = toCenti(widget.data['min_temp'].toInt());
                          }

                          else{
                            temp = widget.data['temp'].toInt();
                            max_temp = widget.data['max_temp'].toInt();
                            min_temp = widget.data['min_temp'].toInt();
                          }

                        });
                      },
                      child: Text("$notUnit°", style: TextStyle(fontSize: 20),),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  Text(
                    '${textCity}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${temp}°',
                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Center(
                    child: Text(
                  'Max: ${max_temp}° Min: ${min_temp}°',
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '${widget.data['description']}',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                    width: 300,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              cursorColor: Colors.black45,
                              style: TextStyle(color: Colors.black45),
                              onChanged: (value) {
                                cityName = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter City Name',
                                hintStyle: TextStyle(color: Colors.black45),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                filled: true,
                                fillColor: Colors.white,
                              )),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoadingScreen(city: cityName)));
                            },
                            child: Text(
                              'Get Weather',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


int toCenti(temp){
  return ((temp.toInt() - 32) * 5/9).round();
}
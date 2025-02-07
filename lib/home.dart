import 'package:flutter/material.dart';
import 'footer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4898FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              //Page Title
              Row(
                children: [
                  Icon(
                    Icons.pin_drop,
                    size: 25,
                    color: Colors.white,
                  ),
                  Text(
                    "Vancouver, BC",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Spacer(),
                  Notification_button(),
                ],
              ),

              //Todays Date

              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                              "Today, Oct 15 15:10",
                              style: TextStyle(color: Colors.white, fontSize: 11),
              ),),

              SizedBox(height: 30,),

              Row(
                children: [
                  Text("16", style: TextStyle(fontSize: 130, color: Colors.white),),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.circle)
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

//Notification Widget
class Notification_button extends StatefulWidget {
  const Notification_button({super.key});

  @override
  State<Notification_button> createState() => _Notification_buttonState();
}

class _Notification_buttonState extends State<Notification_button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xFF61A5FE),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Icon(
          Icons.circle_notifications,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}

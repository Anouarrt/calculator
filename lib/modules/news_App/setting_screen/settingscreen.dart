import 'package:diapackage/Layout/news_app/Cubit/Cubit.dart';
import 'package:flutter/material.dart';


class setting_screen extends StatefulWidget {

  @override
  _myappdarkState createState() => _myappdarkState();
}

class _myappdarkState extends State<setting_screen> {

  static bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Switch(
            value: isSwitched,
            onChanged: (value) {
                  setState(() {
                  isSwitched = value;
                 NewCubit.get(context).changeAppMode();
              print(isSwitched);
              });
            },
            activeTrackColor: Colors.yellow,
            activeColor: Colors.orangeAccent,
          ),
        )
    );
  }
  static bool getResultat(){
    return isSwitched;
  }
}

import 'package:flutter/material.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCustomSwitch(),
    );
  }
}
class MyCustomSwitch extends StatefulWidget {
  @override
  _MyCustomSwitchState createState() => _MyCustomSwitchState();
}

class _MyCustomSwitchState extends State<MyCustomSwitch> {
  bool toggleValue = false;
  int anim_duration = 500;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedContainer(
                duration: Duration(milliseconds: anim_duration, ),
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: toggleValue ? Colors.greenAccent[100] : Colors.redAccent[100],
                ),
                child: Stack(
                    children: <Widget>[
                        AnimatedPositioned(
                            duration: Duration(milliseconds: anim_duration, ),
                            curve: Curves.easeIn,
                            top: 3.0,
                            left: toggleValue ? 60.0 : 0.0,
                            right: toggleValue ? 0.0 : 60.0,
                            child: InkWell(
                                onTap: togglebutton,
                                child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: anim_duration, ),
                                    
                                    child: toggleValue ? 
                                        Icon(Icons.check_circle, color: Colors.green, size: 35.0, key: UniqueKey()) : 
                                        Icon(Icons.remove_circle_outline, color: Colors.red, size: 35.0, key: UniqueKey())

                                )
                            )
                        )
                    ]
                )
            )
        ),
    );
  }

  togglebutton(){
      setState((){
          toggleValue=!toggleValue;
      });
  }
}
import 'dart:html';

import 'package:random_home_workout/chewie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';




void main() => runApp(RandomHomeWorkoutApp());

class RandomHomeWorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Home Workout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChooseMuscleGroup(title: 'Random Home Workout'),
    );
  }
}

class ChooseMuscleGroup extends StatefulWidget {
  ChooseMuscleGroup({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChooseMuscleGroupState createState() => _ChooseMuscleGroupState();
}

class _ChooseMuscleGroupState extends State<ChooseMuscleGroup> {
  bool _buttonStateAbs = true;
  bool _buttonStateLegs = false;
  bool _buttonStateArms = false;

  void _buttonChangeStateAbs() {
    setState(() {
      _buttonStateAbs = !_buttonStateAbs;
    });
  }

  void _buttonChangeStateLegs() {
    setState(() {
      _buttonStateLegs = !_buttonStateLegs;
    });
  }

  void _buttonChangeStateArms() {
    setState(() {
      _buttonStateArms = !_buttonStateArms;
    });
  }

  void _openTimeSelectionWindow() {
    if(_buttonStateAbs==false && _buttonStateArms == false && _buttonStateLegs == false){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: new Text("Please select at least one muscle group"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Okay"),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                ]
            );
      }
      );
    }
    else{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseDuration()),
    );}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              onPressed: _buttonChangeStateAbs,
              child: new Icon(
                Icons.directions_run,
                color: Colors.white,
                size: 60.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: _buttonStateAbs ? Colors.green : Colors.grey,
            ),
            RawMaterialButton(
              onPressed: _buttonChangeStateLegs,
              child: new Icon(
                Icons.access_alarms,
                color: Colors.white,
                size: 60.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: _buttonStateLegs ? Colors.green : Colors.grey,
            ),
            RawMaterialButton(
              onPressed: _buttonChangeStateArms,
              child: new Icon(
                Icons.dashboard,
                color: Colors.white,
                size: 60.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: _buttonStateArms ? Colors.green : Colors.grey,
            ),
            RawMaterialButton(
              onPressed: _openTimeSelectionWindow,
              child: new Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 60.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.blue,
            ),
          ],
        ),

      ),

    );
  }
}







class ChooseDuration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChooseDurationState();
}

class _ChooseDurationState extends State<ChooseDuration> {
  bool _buttonState10Minutes = true;
  bool _buttonState15Minutes = false;
  bool _buttonState20Minutes = false;

  void _buttonChangeState10Minutes() {
    setState(() {
      if (!_buttonState10Minutes) {
        _buttonState10Minutes = !_buttonState10Minutes;
        _buttonState20Minutes = false;
        _buttonState15Minutes = false;
      } else {
        _buttonState10Minutes = !_buttonState10Minutes;
      }
    });
  }

  void _buttonChangeState15Minutes() {
    setState(() {
      if (!_buttonState15Minutes) {
        _buttonState15Minutes = !_buttonState15Minutes;
        _buttonState10Minutes = false;
        _buttonState20Minutes = false;
      } else {
        _buttonState15Minutes = !_buttonState15Minutes;
      }
    });
  }

  void _buttonChangeState20Minutes() {
    setState(() {
      if (!_buttonState20Minutes) {
        _buttonState20Minutes = !_buttonState20Minutes;
        _buttonState15Minutes = false;
        _buttonState10Minutes = false;
      } else {
        _buttonState20Minutes = !_buttonState20Minutes;
      }
    });
  }

  void _startWorkout() {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => VideoPlayer()),
  );}

  void back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Duration"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RawMaterialButton(
              onPressed: _buttonChangeState15Minutes,
              child: new Text('15min',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: _buttonState15Minutes ? Colors.green : Colors.grey,
            ),
            RawMaterialButton(
              onPressed: _buttonChangeState20Minutes,
              child: new Text('20min',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: _buttonState20Minutes ? Colors.green : Colors.grey,
            ),
            RawMaterialButton(
              onPressed: _buttonChangeState10Minutes,
              child: new Text('10min',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: _buttonState10Minutes ? Colors.green : Colors.grey,
            ),
            RawMaterialButton(
              onPressed: _startWorkout,
              child: new Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 60.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.blue,
            ),
            RawMaterialButton(
              onPressed: back,
              child: new Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 60.0,
              ),
              shape: new CircleBorder(),
              elevation: 2.0,
              fillColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}



























class VideoPlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePage();
}

class MyHomePage extends State<VideoPlayer> {

  void back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/example.mp4',
            ),
            looping: true,

          ),

          RawMaterialButton(
            onPressed: back,
            child: new Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 60.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
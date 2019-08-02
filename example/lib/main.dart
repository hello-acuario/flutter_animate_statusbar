import 'package:animate_status_bar/animate_status_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String frameData = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(frameData),
              IconButton(
                icon: Icon(Icons.print),
                onPressed: () {
                  AnimateStatusBar.setFrame(x: 0, y: 0, duration: 0.5);
                },
              ),
              IconButton(
                icon: Icon(Icons.print),
                onPressed: () async {
                  var frame = await AnimateStatusBar.frame;
                  setState(() {
                    frameData =
                        'x:${frame.x},y:${frame.y},width:${frame.width},height:${frame.height}';
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

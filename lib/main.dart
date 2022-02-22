import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double spreadRadiusValue = 0;
  double blurRadiusValue = 0;
  double dxOffset = 0;
  double dyOffset = 0;

  Color currentContainerColor = Colors.white;
  Color currentShadowColor = Colors.white;
  Color pickerColor = Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Container(width: double.infinity),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  color: currentContainerColor,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color:Color(0xFF707070)),
                  boxShadow: [
                    BoxShadow(
                        color: currentShadowColor,
                        blurRadius: blurRadiusValue,
                        spreadRadius: spreadRadiusValue,
                        offset: Offset(dxOffset, dyOffset)
                    )
                  ]
              ),
            ),

            SizedBox(height: 100),
            OutlinedButton(onPressed: () {
              showDialog(
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Pick your favorite color"),

                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        ColorPicker(
                        pickerColor: currentContainerColor,
                        onColorChanged: (newColor) {
                          pickerColor = newColor;
                        },
                      ),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                currentContainerColor = pickerColor;
                              });
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: 20),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ]),
                    );

                  }, context: context

              );
            }, child: Text("Container color")),
            SizedBox(height: 20),
            OutlinedButton(onPressed: () {
              showDialog(
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Pick your favorite color"),

                      content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ColorPicker(
                              pickerColor: currentShadowColor,
                              onColorChanged: (newColor) {
                                pickerColor = newColor;
                              },
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      currentShadowColor = pickerColor;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width: 20),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ]),
                    );

                  }, context: context
              );
            }, child: Text("Shadow color")),
            SizedBox(height: 30),
            Text('blurRadius'),
            Slider(
              min: 0.0,
              max: 100.0, value: blurRadiusValue, onChanged: (double value) {
              setState(() {
                blurRadiusValue = value;
              });
            },
            ),
            SizedBox(height: 15),
            Text('spreadRadius'),
            Slider(
              min: 0.0,
              max: 100.0, value: spreadRadiusValue, onChanged: (double value) {
              setState(() {
                spreadRadiusValue = value;
              });
            },
            ),
            SizedBox(height: 15),
            Text('dx offset'),
            Slider(
              min: -100,
              max: 100, value: dxOffset, onChanged: (double value) {
              setState(() {
                dxOffset = value;
              });
            },
            ),
            SizedBox(height: 15),
            Text('dy offset'),
            Slider(
              min: -100,
              max: 100, value: dyOffset, onChanged: (double value) {
              setState(() {
                dyOffset = value;
              });
            },
            ),
            Text("spreadRadiusValue : $spreadRadiusValue"),
            Text("blurRadiusValue : $blurRadiusValue"),
            Text("dxOffset : $dxOffset"),
            Text("dyOffset : $dyOffset"),
          ],
        ),
      ),
    );
  }
}

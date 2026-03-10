import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, home: HumorApp()),
    );
}

class HumorApp extends StatefulWidget {
  const HumorApp({super.key});

  @override
  State<HumorApp> createState() => _HumorAppState();
}

class _HumorAppState extends State<HumorApp> {
  int index = 0;

  void alternarHumor() {
    setState(() {
      index += 1;
      index = index % 3;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Humor",style: TextStyle(color: Colors.black),)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              switch(index){
                0 => Icons.sentiment_satisfied_sharp,
                1 => Icons.sentiment_neutral_outlined,
                _ => Icons.sentiment_dissatisfied_sharp,
              },
              size: 100,
              color: switch(index){
                0 => Colors.yellow,
                1 => Colors.blueGrey,
                _ => Colors.red
              },
            ),

            ElevatedButton(
              onPressed: alternarHumor,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                ),
                child: Text(
                  "Humor",
                  style: TextStyle(color: Colors.black),
                ),
              )
          ],
        ),
      ),
    );
  }
}
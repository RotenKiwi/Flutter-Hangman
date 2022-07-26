import 'package:flutter/material.dart';
import 'package:hangman/utilities/game.dart';
import 'package:hangman/widget/figureImage.dart';
import 'package:hangman/widget/letter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String word="Flutter".toUpperCase();
  List<String> alphabets=["A","B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF98EE96),
      appBar: AppBar(
        title: Text('HangMan'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF77C15B)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(Game.tries >=0, "assets/hang.png"),
                figureImage(Game.tries >=0, "assets/head.png"),
                figureImage(Game.tries >=0, "assets/body.png"),
                figureImage(Game.tries >=0, "assets/la.png"),
                figureImage(Game.tries >=0, "assets/ra.png"),
                figureImage(Game.tries >=0, "assets/ll.png"),
                figureImage(Game.tries >=0, "assets/rl.png"),
              ], //children
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word.split("").map((e) => letter(e.toUpperCase(), !Game.selectedChar.contains(e.toUpperCase()))).toList(),
          ),

          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(
                  onPressed: Game.selectedChar.contains(e) ? null : () {
                    setState(() {
                      Game.selectedChar.add(e);
                      print(Game.selectedChar);
                      if (!word.split('').contains(e.toUpperCase()))
                        Game.tries++;
                    }
                    ); //setState
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fillColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : Colors.blue,
                );
              }).toList(),
            ),
          )
        ], //children
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gamepage.dart';

class About extends StatelessWidget{
  //i changed it to black color
  static var myNewFont = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.black,
    letterSpacing: 1,fontSize: 16,
  ));

  static var myNewFontRed = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.red,
    letterSpacing: 3,
  )
  );
  static var myNewFontWhite = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.white,
      letterSpacing: 3));

  static var fontAboutRed = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.red,
    fontSize: 10,
  )
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.red,
        title: Text(
          'About App',
          style: myNewFont,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Text(
                'Hello,\n'
                    'I am Divyanshu\n'
                    'If you are really reading this..\ni am sorry because i am wasting your time.\n'
                    'But I wanted to create this additional dart file to\t'
                    'give credit to the original developer of'
                    '\tthis flutter app.\n\n'
                    '"MITCH KOKO"\t he is the original developer and i followed his\t'
                    'tutorial ... to learn how to\t'
                    'use Dart and to learn some flutter widgets.'
                    '\nI followed every thing from fonts to fuctionality.'
                    '\nBut i made some changes in Gridview and design.\n'
                    '\nThanks to "MITCH KOKO" for his amazing tutoral.',
                style: GoogleFonts.play(
                    textStyle:TextStyle(color: Colors.white,letterSpacing: 0.5,
                  wordSpacing: 1.5,fontSize: 18,
                    )
                ),
              ),


            ),
          ),
          Container(
            child:GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GamePage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20.0,bottom: 20.0,right: 20,),
                child: SizedBox(
                  //borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(30),
                    color: Colors.red,
                    child: Center(
                      child:  Text('Continue to game.',style: myNewFont,),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
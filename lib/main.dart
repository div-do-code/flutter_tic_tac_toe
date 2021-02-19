import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/about.dart';
import 'package:tictactoe/gamepage.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),

    );

  }

}

class IntroScreen extends StatefulWidget{
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState  extends State<IntroScreen> with SingleTickerProviderStateMixin{
  //i chnaged it to black color
  static var myNewFont = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.black,
    letterSpacing: 3,
  )
  );
  static var fontAboutRed = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.red,
    fontSize: 10,
  )
  );
  static var myNewFontRed = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.red,
    letterSpacing: 1,fontSize: 28,
  )
  );
  /*
  static var myNewFontWhite = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.white,
  letterSpacing: 3));
  */

  @override
  Widget build(BuildContext context) {
    //final color = Colors.red;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Container(
                    child: Text("TIC TAC TOE",
                    style: myNewFontRed,
                      //TextStyle(color: Colors.red,fontSize: 30,),
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 35.0),
                  child: AvatarGlow(
                    endRadius:130 ,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.red,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none
                        ),
                        shape: BoxShape.rectangle
                      ),
                      
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child:  Container(
                          child:  Image.asset('lib/img/tttimg.png',
                          //color: Colors.black,
                          fit: BoxFit.scaleDown,
                          ),
                        ),
                        radius: 85.0,
                      ),
                      
                    ),
                  ),
                ),
              ),

                      Expanded(
                        child: Padding(
                          padding:  const EdgeInsets.only(top: 80.0),
                        ),
                      ),
              GestureDetector(
                onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                );
              },
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0,bottom: 50.0,right: 20),
                  child: ClipRect(
                      //borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(30),
                      color: Colors.red,
                      child: Center(
                        child:  Text('Play Game',style: myNewFont,),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child:FlatButton(
                    child: Text('About Game and Developers.',
                      style: fontAboutRed,

                    ),
                    onPressed: (){
                      Navigator.push(context,
                          //change here for new screen.
                          MaterialPageRoute(builder: (context)=>About()
                          )
                      );
                    }
                ),

              ),
            ],

          ),
        ),
      ),
    );
  }

}
 import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';

import 'about.dart';

class GamePage extends StatefulWidget{
  @override
  _GamePageState createState() => _GamePageState();

}

class _GamePageState extends State<GamePage> {

  List<String> ExOh =[
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',

  ];
  bool OhTurn = true;// 1st player is O
  var myTextStyle = TextStyle(color: Colors.white,fontSize: 30);
  int ohScore =0;
  int exScore=0;
  int filledBoxes=0;


  //i changed it to black color
  static var myNewFont = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.black, fontSize: 40,
    letterSpacing: 3,
    fontWeight: FontWeight.bold,
  ));

  static var myNewFontRed = GoogleFonts.pressStart2P(textStyle:
  TextStyle(color: Colors.red,
    letterSpacing: 2,
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
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          SizedBox(height: 15,
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player O', style: myNewFontRed,),
                        SizedBox(
                          height: 20.0,

                        ),
                        Text(ohScore.toString(),style: myNewFontRed,),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player X', style: myNewFontRed,),
                        SizedBox(
                          height: 20.0,

                        ),
                        Text(exScore.toString(),style: myNewFontRed,),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ),
          Expanded(
            flex: 4,
            child:  GridView.builder(
              itemCount: 9,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
           itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    _tapped(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    decoration:
                    new BoxDecoration(color: Colors.red,
                        border: Border.all(color: Colors.red),borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [BoxShadow(
                            color: Colors.grey[900],
                            offset: Offset(5.0,5.0),
                            blurRadius: 10.0,
                            spreadRadius: 5.0

                        ),
                          BoxShadow(
                              color: Colors.grey[900],
                              offset: Offset(-5.0,-5.0),
                              blurRadius: 10.0,
                              spreadRadius: 5.0

                          )]
                    ),


                    child: Center(
                      child: Text(
                        ExOh[index],
                        //box text
                        style: myNewFont,
                      ),
                    ),
                  ),

                );
           },
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('Hey,i am ', style: myNewFontWhite,),
                    SizedBox(height: 5, width: 20,),
                    Text('Practicing flutter.', style: myNewFontWhite,),
                    Container(
                      child:FlatButton(
                          child: Text('Read about App and Developers.',
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
          ),
        ],
      ),

    );
  }
  void _tapped(int index) {
    setState(() {
      if(OhTurn && ExOh[index]=='' ){
        ExOh[index] ='O';
        filledBoxes= filledBoxes+1;
        //we can also use shorthand oprator here
      }else if(!OhTurn && ExOh[index]==''){
        ExOh[index] ='X';
        filledBoxes= filledBoxes+1;

      }
      OhTurn =!OhTurn;
      _checkWinner();

    });
  }
  void _checkWinner(){
    // checks 1st row
    if (ExOh[0] == ExOh[1] &&
        ExOh[0] == ExOh[2] &&
        ExOh[0] != '') {
      _showWinDialog(ExOh[0]);
    }

    // checks 2nd row
    if (ExOh[3] == ExOh[4] &&
        ExOh[3] == ExOh[5] &&
        ExOh[3] != '') {
      _showWinDialog(ExOh[3]);
    }

    // checks 3rd row
    if (ExOh[6] == ExOh[7] &&
        ExOh[6] == ExOh[8] &&
        ExOh[6] != '') {
      _showWinDialog(ExOh[6]);
    }

    // checks 1st column
    if (ExOh[0] == ExOh[3] &&
        ExOh[0] == ExOh[6] &&
        ExOh[0] != '') {
      _showWinDialog(ExOh[0]);
    }

    // checks 2nd column
    if (ExOh[1] == ExOh[4] &&
        ExOh[1] == ExOh[7] &&
        ExOh[1] != '') {
      _showWinDialog(ExOh[1]);
    }

    // checks 3rd column
    if (ExOh[2] == ExOh[5] &&
        ExOh[2] == ExOh[8] &&
        ExOh[2] != '') {
      _showWinDialog(ExOh[2]);
    }

    // checks diagonal
    if (ExOh[6] == ExOh[4] &&
        ExOh[6] == ExOh[2] &&
        ExOh[6] != '') {
      _showWinDialog(ExOh[6]);
    }

    // checks diagonal
    if (ExOh[0] == ExOh[4] &&
        ExOh[0] == ExOh[8] &&
        ExOh[0] != '') {
      _showWinDialog(ExOh[0]);
    }

    else if(filledBoxes == 9){
      _showDrawDialog();
    }

  }
void _showWinDialog(String winner){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Winner is\t'+winner),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Play Again'
              ),
              onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),


          ],
        );

      });
    if(winner=='O'){
      ohScore=ohScore+1;
    }
    else if(winner=='X'){
      exScore=exScore+1;
    }

}
  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: <Widget>[
              FlatButton(
                child: Text('Play Again!'),
                onPressed: (){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

  }

  void _clearBoard(){
    setState(() {
      for(int i=0;i<9;i++){
        ExOh[i]='';

      }
    });

  }


}


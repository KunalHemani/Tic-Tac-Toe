import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool OTurn = true; // The first player turn is O!
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);

  int ohScore = 0;
  int exScore = 0;

  int filledBoxes = 0;

  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3)
  );

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player O', style: myNewFontWhite,),
                          Text(ohScore.toString(), style: myNewFontWhite,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player X', style: myNewFontWhite,),
                          Text(exScore.toString(), style: myNewFontWhite,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration:
                            BoxDecoration(border: Border.all(color: Colors.white70)),
                        child: Center(
                          child: Text(
                            displayExOh[index],
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text('TIC TAC TOE', style: myNewFontWhite,),

                      SizedBox(height: 60),

                      Text('@CREATED BY KUNAL HEMANI', style: myNewFontWhite,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {

    setState(() {
      if (OTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes += 1;
      } else if(!OTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBoxes += 1;
      }

      OTurn = !OTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {

    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '')
    {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '')
    {
      _showWinDialog(displayExOh[3]);
    }

    // checks 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '')
    {
      _showWinDialog(displayExOh[6]);
    }

    // checks 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '')
    {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '')
    {
      _showWinDialog(displayExOh[1]);
    }

    // checks 3rd column
    if (displayExOh[2] == displayExOh[3] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '')
    {
      _showWinDialog(displayExOh[2]);
    }

    // checks diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '')
    {
      _showWinDialog(displayExOh[0]);
    }

    // checks diagonal
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '')
    {
      _showWinDialog(displayExOh[2]);
    }

    else if(filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('DRAW'),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again!!'),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('WINNER IS: ' + winner),
          actions: <Widget>[
            TextButton(
              child: Text('Play Again!!'),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
    });

    if(winner == 'O')
    {
      ohScore = ohScore + 1;
    }
    else if(winner == 'X')
    {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for(int i=0 ; i<9 ; i++)
      {
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;
  }
}

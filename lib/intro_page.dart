import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  static var myNewFont = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3));

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 120.0),
                child: Container(
                  child: Text(
                    "TIC TAC TOE",
                    style: myNewFontWhite.copyWith(fontSize: 30),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: AvatarGlow(
                  duration: Duration(seconds: 2),
                  glowRadiusFactor: 140,
                  glowColor: Colors.white,
                  repeat: true,
                  startDelay: Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none
                      ),
                      shape: BoxShape.circle
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      child: Container(
                        child: Image.asset(
                            'assets/images/tictac.png',
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      radius: 80.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text('@CREATED BY KUNAL HEMANI'),
              ))
          ],
        ),
      ),
    );
  }
}

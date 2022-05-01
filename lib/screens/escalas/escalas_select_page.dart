import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:tile_teacher/components/rounded_button.dart';
import 'package:tile_teacher/constants.dart';
import 'package:tile_teacher/screens/escalas/components/background.dart';
import 'package:tile_teacher/screens/escalas/escalas_page1.dart';
import 'package:tile_teacher/screens/escalas/escalas_page1.dart';
import 'package:tile_teacher/screens/escalas/escalas_page1.dart';
import 'package:tile_teacher/screens/escalas/escalas_page1.dart';
import 'package:tile_teacher/screens/escalas/escalas_page1.dart';
import 'package:tile_teacher/screens/escalas/escalas_page1.dart';
import 'package:tile_teacher/screens/escalas/escalas_page1.dart';
import 'package:tile_teacher/screens/escalas/escalas_page2.dart';

class EscalasSelectPage extends StatelessWidget {
  const EscalasSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(title: 'Escalas'),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Body> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Body> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Background(
            child: SingleChildScrollView(
                child: Column(
          children: [
            RoundedButton(
              text: "INTRO",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/maior/intro"),
                    builder: (context) {
                      return EscalasPage1(escala: INTRO);
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "DO MAIOR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/maior/do"),
                    builder: (context) {
                      return EscalasPage1(escala: DO_MAIOR);
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "RE MAIOR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/maior/re"),
                    builder: (context) {
                      return EscalasPage1(escala: RE_MAIOR);
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "MI MAIOR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/maior/mi"),
                    builder: (context) {
                      return EscalasPage1(escala: MI_MAIOR);
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "FA MAIOR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/maior/fa"),
                    builder: (context) {
                      return EscalasPage1(escala: FA_MAIOR);
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SOL MAIOR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/maior/sol"),
                    builder: (context) {
                      return EscalasPage1(escala: SOL_MAIOR);
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "LA MAIOR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/maior/la"),
                    builder: (context) {
                      return EscalasPage1(escala: LA_MAIOR);
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SI MAIOR",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/maior/si"),
                    builder: (context) {
                      return EscalasPage1(escala: SI_MAIOR);
                    },
                  ),
                );
              },
            ),
          ],
        ))));
  }
}

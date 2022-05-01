import 'package:flutter/material.dart';
import 'package:tile_teacher/components/rounded_button.dart';
import 'package:tile_teacher/screens/acordes/acordes_select_page.dart';
import 'package:tile_teacher/screens/escalas/escalas_page2.dart';
import 'package:tile_teacher/screens/escalas/escalas_select_page.dart';
import 'package:tile_teacher/screens/welcome/components/background.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.title}) : super(key: key);

  // This Widgets is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App Widgets) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
              text: "ESCALAS",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas"),
                    builder: (context) {
                      return const EscalasSelectPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "ACORDES",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/acordes"),
                    builder: (context) {
                      return const AcordesSelectPage();
                    },
                  ),
                );
              },
            )
          ],
        ))));
  }
}

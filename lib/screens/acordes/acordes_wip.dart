import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:tile_teacher/components/escala.dart';
import 'package:tile_teacher/components/message.dart';
import 'package:tile_teacher/components/rounded_button.dart';
import 'package:tile_teacher/constants.dart';
import 'package:tile_teacher/screens/escalas/components/background.dart';
import 'package:tile_teacher/screens/escalas/escalas_page2.dart';
import 'package:tile_teacher/screens/escalas/escalas_page3.dart';

class AcordesWIP extends StatelessWidget {
  const AcordesWIP({Key? key, required this.escala}) : super(key: key);

  final Escala escala;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(title: escala.title, escala: escala),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key, required this.title, required this.escala}) : super(key: key);

  final String title;
  final Escala escala;

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Background(
            child: Stack(children: [
          SingleChildScrollView(
              child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/wip.png",
                    width: size.width,
                    alignment: Alignment.topLeft,
                  )),
              //margin: const EdgeInsets.all(10)),
              Message(text: "This page is still work in progress", status: Status.ERROR),
            ],
          )),
          Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
                },
                child: const Icon(Icons.check),
              )),
        ])));
  }
}

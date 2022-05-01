import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:tile_teacher/components/escala.dart';
import 'package:tile_teacher/components/message.dart';
import 'package:tile_teacher/components/rounded_button.dart';
import 'package:tile_teacher/constants.dart';
import 'package:tile_teacher/screens/escalas/components/background.dart';
import 'package:tile_teacher/screens/escalas/escalas_page2.dart';
import 'package:tile_teacher/screens/escalas/escalas_page3.dart';

class EscalasPage1 extends StatelessWidget {
  const EscalasPage1({Key? key, required this.escala}) : super(key: key);

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
                    "assets/images/" + widget.escala.image,
                    width: size.width,
                    alignment: Alignment.topLeft,
                  )),
              //margin: const EdgeInsets.all(10)),
              Message(text: widget.escala.introduction, status: Status.SUCCESS),
            ],
          )),
          Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: const RouteSettings(name: "/escalas/page/2"),
                      builder: (context) {
                        return EscalasPage2(escala: widget.escala);
                      },
                    ),
                  );
                },
                child: const Icon(Icons.check),
              )),
        ])));
  }
}

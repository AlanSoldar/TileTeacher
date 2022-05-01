import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:tile_teacher/components/escala.dart';
import 'package:tile_teacher/constants.dart';
import 'package:tile_teacher/screens/escalas/escalas_page4.dart';
import 'package:tile_teacher/screens/welcome/components/background.dart';

class EscalasPage3 extends StatelessWidget {
  const EscalasPage3({Key? key, required this.escala}) : super(key: key);

  final Escala escala;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(title: escala.title, selectedNotes: [], escala: escala),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key, required this.title, required this.selectedNotes, required this.escala})
      : super(key: key);

  final String title;
  final Escala escala;
  List<NotePosition> selectedNotes;
  final String url = "https://www.youtube.com/watch?v=Yp2lI-ZO40Y";

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
          child: Stack(children: [
        CupertinoApp(
            title: 'Piano Test',
            home: Center(
              child: InteractivePiano(
                highlightedNotes: widget.selectedNotes,
                animateHighlightedNotes: true,
                highlightColor: Colors.blue,
                naturalColor: Colors.white,
                accidentalColor: Colors.black,
                hideScrollbar: false,
                hideNoteNames: true,
                keyWidth: 50,
                noteRange: NoteRange.forClefs([
                  Clef.Treble,
                ]),
                onNotePositionTapped: (position) {
                  if (widget.selectedNotes.any((element) =>
                      element.octave == position.octave &&
                      element.note == position.note &&
                      element.accidental == position.accidental)) {
                    widget.selectedNotes.removeWhere((element) =>
                        element.octave == position.octave &&
                        element.note == position.note &&
                        element.accidental == position.accidental);
                  } else {
                    widget.selectedNotes.add(NotePosition(
                        note: position.note,
                        octave: position.octave,
                        accidental: position.accidental));
                  }
                  //print(selectedNotes.length);
                  setState(() {});
                  // Use an audio library like flutter_midi to play the sound
                },
              ),
            )),
        Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/escalas/page4"),
                    builder: (context) {
                      return EscalasPage4(selectedNotes: widget.selectedNotes, escala: widget.escala);
                    },
                  ),
                );
              },
              child: const Icon(Icons.check),
            ))
      ])),
    );
  }
}

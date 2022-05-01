import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:tile_teacher/components/escala.dart';
import 'package:tile_teacher/components/message.dart';
import 'package:tile_teacher/constants.dart';
import 'package:tile_teacher/screens/welcome/components/background.dart';

class EscalasPage4 extends StatelessWidget {
  EscalasPage4({Key? key, required this.selectedNotes, required this.escala})
      : super(key: key);

  List<NotePosition> selectedNotes;
  Escala escala;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Body(title: escala.title, selectedNotes: selectedNotes, escala: escala),
    );
  }
}

class Body extends StatefulWidget {
  Body(
      {Key? key,
      required this.title,
      required this.selectedNotes,
      required this.escala})
      : super(key: key);

  final String title;
  List<NotePosition> selectedNotes;
  Escala escala;

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
    bool isCorrect = checkAwnser(widget.selectedNotes, widget.escala);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Background(
          child: Stack(children: [
        CupertinoApp(
            title: 'Piano Result',
            home: Center(
              child: InteractivePiano(
                highlightedNotes: widget.selectedNotes,
                animateHighlightedNotes: true,
                highlightColor: isCorrect ? Colors.green : Colors.red,
                naturalColor: Colors.white,
                accidentalColor: Colors.black,
                hideScrollbar: false,
                keyWidth: 50,
                hideNoteNames: true,
                noteRange: NoteRange.forClefs([
                  Clef.Treble,
                ]),
                onNotePositionTapped: (position) {},
              ),
            )),
        Align(
            alignment: Alignment.topRight,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {Navigator.popUntil(context, ModalRoute.withName('/escalas'));},
              child: const Icon(Icons.check),
            )),
        Align(
            alignment: Alignment.topLeft,
            child: Message(text: isCorrect ? "Parabens. Sua resposta esta correta!" : "Ops. Sua resposta esta errada!", status: isCorrect ? Status.SUCCESS : Status.ERROR))
      ])),
    );
  }

  bool checkAwnser(
      List<NotePosition> selectedNotes, Escala escala) {
    return escala.noteList.every((escalaNote) => selectedNotes.any((selectedNote) {
          print(
              '${escalaNote.name}, ${selectedNote.name}, ${escalaNote.octave}, ${selectedNote.octave}');
          return escalaNote.name == selectedNote.name &&
              escalaNote.octave == selectedNote.octave &&
              escalaNote.accidental == selectedNote.accidental;
        }));
  }
}

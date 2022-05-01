import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:tile_teacher/components/escala.dart';
import 'package:tile_teacher/constants.dart';
import 'package:tile_teacher/screens/escalas/components/background.dart';
import 'package:tile_teacher/screens/escalas/escalas_page3.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EscalasPage2 extends StatelessWidget {
  const EscalasPage2({Key? key, required this.escala}) : super(key: key);

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
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.escala.url)
          .toString(), //Add videoID.
      flags: YoutubePlayerFlags(
        startAt: widget.escala.startAt,
        endAt: widget.escala.endAt,
        hideThumbnail: true,
        hideControls: true,
        controlsVisibleAtStart: false,
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Background(
          child: Stack(children: [
            Align(
                alignment: Alignment.center,
                child: SizedBox.square(
                    child: YoutubePlayer(
                        controller: controller,
                        showVideoProgressIndicator: false,
                        progressIndicatorColor: kPrimaryColor,
                        onEnded: (metaData) => {
                              nextPage(),
                            }))),
            Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    nextPage();
                  },
                  child: const Icon(Icons.check),
                ))
          ]),
        ));
  }

  void nextPage() {
    if (widget.title == INTRO.title) {
      Navigator.popUntil(context, ModalRoute.withName('/escalas'));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              settings: const RouteSettings(name: "/escalas/page2"),
              builder: (context) {
                return EscalasPage3(escala: widget.escala);
              }));
    }
  }
}

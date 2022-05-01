// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:tile_teacher/components/rounded_button.dart';
import 'package:tile_teacher/screens/home/home_screen.dart';
import 'package:tile_teacher/screens/welcome/components/background.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //WatchNextDatabase.recreateDB();
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "WELCOME TO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/images/title_blue.png",
              height: size.height * 0.2,
            ),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.08),
            RoundedButton(
              text: "ENTER",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: const RouteSettings(name: "/home"),
                    builder: (context) {
                      return const HomeScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

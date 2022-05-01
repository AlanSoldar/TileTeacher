import 'package:flutter/material.dart';
import 'package:tile_teacher/constants.dart';

class Message extends StatelessWidget {
  Message({
    Key? key,
    required this.text,
    required this.status,
  }) : super(key: key);

  final String text;
  final Status status;
  Color color = kSuccessColor;
  Color lightColor = kSuccessLightColor;
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    color = status == Status.SUCCESS ? kSuccessColor: kErrorColor;
    lightColor = status == Status.SUCCESS ? kSuccessLightColor: kErrorLightColor;
    return Container(
      margin: const EdgeInsets.symmetric(vertical:2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: CustomMessage(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget CustomMessage() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              lightColor,
            ],
          )),
    );
  }
}

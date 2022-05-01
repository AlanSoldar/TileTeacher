import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:piano/piano.dart';
import 'package:tile_teacher/constants.dart';

class Escala {

  String title;
  String url;
  List<NotePosition> noteList;
  String image;
  String introduction;
  int startAt;
  int endAt;

  Escala(this.title, this.url, this.startAt, this.endAt, this.image, this.introduction, this.noteList);

}
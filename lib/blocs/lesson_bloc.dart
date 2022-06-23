import 'dart:async';

import 'package:bloc/data/lesson_services.dart';
import 'package:bloc/models/lesson.dart';

class LessonBloc {
  final lessonStreamController = StreamController.broadcast();

  Stream get getStream => lessonStreamController.stream;
  List<Lesson> getALL() {
    return LessonServices.getAll();
  }
}

final lessonBloc = LessonBloc();

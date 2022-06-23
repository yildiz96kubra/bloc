import 'package:bloc/models/lesson.dart';

class LessonServices {
  static List<Lesson> lessons = <Lesson>[];

  static final LessonServices _singleton = LessonServices._internal();

  factory LessonServices() {
    return _singleton;
  }

  LessonServices._internal();

  static List<Lesson> getAll() {
    lessons.add(Lesson(1, "Matematik", 6.0));
    lessons.add(Lesson(2, "Fizik", 4.0));
    lessons.add(Lesson(3, "Kimya", 3.0));
    lessons.add(Lesson(4, "Biyoloji", 7.0));
    lessons.add(Lesson(4, "Tarih", 4.0));
    lessons.add(Lesson(4, "Edebiyat", 2.0));
    lessons.add(Lesson(4, "Geometri", 3.0));
    return lessons;
  }
}

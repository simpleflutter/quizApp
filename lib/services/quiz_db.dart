import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';

class QuizDB {
  // single tone class
  QuizDB._();
  static final QuizDB instance = QuizDB._();

  // get name of course from courses table
  Future<List<String>> getCourses() async {
    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> maps =
        await db.query('courses', columns: ['name']);
    //select name from courses

    List<String> courses = [];

    for (int i = 0; i < maps.length; i++) {
      courses.add(maps[i]['name'].toString());
      // print(courses[i]);
    }

    return courses;
  }

  // get different levels from questions table
  Future<List<String>> getLevels() async {
    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> maps =
        await db.query('questions', columns: ['level'], distinct: true);
    //select distinct level form questions

    List<String> levels = [];

    for (int i = 0; i < maps.length; i++) {
      levels.add(maps[i]['level'].toString());
      // print(levels[i]);
    }

    return levels;
  }

  // get id for give Course
  Future<int> getGetCourseId(String course) async {
    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> maps = await db.query('courses',
        columns: ['id'], where: 'name=?', whereArgs: [course]);

    int courseId = maps[0]['id'];
    return courseId;
  }

  // count questions for given coures & level
  Future<int> getQuestionCount(String course, String level) async {
    int courseId = await getGetCourseId(course);

    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> maps = await db.rawQuery(
        'select count(*) as counter from questions where course_id=? and level=?',
        [courseId, level]);

    int counter = maps[0]['counter'];
    return counter;
  }
}

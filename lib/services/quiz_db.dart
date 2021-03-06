import 'package:quiz/models/question.dart';
import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
import 'package:quiz/models/quiz.dart';

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

  // get name of course from id
  Future<String> getCourseName(int id) async {
    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> maps = await db.query('courses',
        columns: ['name'], where: 'id=?', whereArgs: [id]);
    //select name from courses

    String course = maps[0]['name'];

    return course;
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

  // get question ids for selected course, level & number of questions
  Future<List<int>> getQuestionIds(String course, String level, int no) async {
    int courseId = await getGetCourseId(course);

    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> maps = await db.rawQuery(
        'select id from questions where course_id=? and level=?',
        [courseId, level]);

    List<int> questionIds = [];

    for (int i = 0; i < maps.length; i++) {
      questionIds.add(maps[i]['id']);
    }

    questionIds.shuffle();
    questionIds = questionIds.sublist(0, no);

    return questionIds;
  }

  //get question data for given question id
  Future<Question> getQuestion(int id) async {
    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> map =
        await db.rawQuery('select * from questions where id=?', [id]);

    Question q = Question.fromMap(map[0]);

    return q;
  }

  //Store quiz data in database
  Future<int> storeQuizData(
      String course,
      String quizTime,
      String quizDate,
      String level,
      String quizQuestions,
      String quizAnswers,
      int totalQuestions,
      int answers,
      int unanswered,
      int correct,
      int wrong,
      int score) async {
    int courseId = await getGetCourseId(course);

    Database db = await DBHelper.instance.database;

    String sqlCommand =
        "insert into quiz values(null, $courseId, '$quizTime', '$quizDate', '$level', '$quizQuestions', '$quizAnswers', $totalQuestions, $answers, $unanswered, $correct, $wrong, $score)";

    await db.rawInsert(sqlCommand);

    List<Map<String, dynamic>> maps =
        await db.rawQuery('select max(id) as quiz_id from quiz');

    int currentQizId = maps[0]['quiz_id'];

    return currentQizId;
  }

  Future<List<Quiz>> getAllQuizData() async {
    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> maps =
        await db.rawQuery('select * from quiz order by id desc');

    List<Quiz> quizes = [];

    for (int i = 0; i < maps.length; i++) {
      quizes.add(Quiz.fromMap(maps[i]));
    }
    // print('Inside getAllQuizData()');
    // print(quizes);
    return quizes;
  }

  Future<Quiz> getQuizById(int quizID) async {
    Database db = await DBHelper.instance.database;

    List<Map<String, dynamic>> maps =
        await db.rawQuery('select * from quiz where id = ?', [quizID]);

    Quiz quiz;

    quiz = Quiz.fromMap(maps[0]);

    return quiz;
  }
}

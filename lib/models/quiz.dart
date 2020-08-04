import 'package:quiz/services/quiz_db.dart';

class Quiz {
  int id;
  int courseId;
  String course;
  String quizDate;
  String quizTime;
  String level;
  List<String> questions;
  List<String> answers;
  int totalQuestions;
  int answered;
  int unanswered;
  int correct;
  int wrong;
  int score;

  Quiz.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.courseId = map['course_id'];
    this.quizDate = map['quiz_date'];
    this.quizTime = map['quiz_time'];
    this.level = map['level'];
    this.questions = map['questions'].toString().split(',');
    this.answers = map['answers'].toString().split(',');
    this.totalQuestions = map['total_questions'];
    this.answered = map['answered'];
    this.unanswered = map['unanswered'];
    this.correct = map['correct'];
    this.wrong = map['wrong'];
    this.score = map['score'];
    setCourse();
  }

  void setCourse() async {
    this.course = await QuizDB.instance.getCourseName(this.courseId);
  }
}

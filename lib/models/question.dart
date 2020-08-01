class Question {
  String questionText;
  String optiona;
  String optionb;
  String optionc;
  String optiond;
  String answer;

  Question(
    this.questionText,
    this.optiona,
    this.optionb,
    this.optionc,
    this.optiond,
    this.answer,
  );

  Question.fromMap(Map<String, dynamic> map) {
    this.questionText = map['question_text'];
    this.optiona = map['optiona'];
    this.optionb = map['optionb'];
    this.optionc = map['optionc'];
    this.optiond = map['optiond'];
    this.answer = map['answer'];
  }
}

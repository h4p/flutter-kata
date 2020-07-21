class Answer {
  final int id;
  final String created_date;
  final int habit;
  final int duration_in_min;


  Answer({this.id, this.created_date, this.habit, this.duration_in_min});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      created_date: json['created_date'],
      habit: json['habit'],
      duration_in_min: json['duration_in_min']
    );
  }

  Map toJson() => {
    'created_date': created_date,
    'habit': habit,
    'duration_in_min': duration_in_min
  };

}
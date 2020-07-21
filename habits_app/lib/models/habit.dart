class Habit {
  final int id;
  final String name;

  Habit({this.id, this.name});

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
        name: json['name'],
    );
  }

  Map toJson() => {
    'name': name,
  };
}
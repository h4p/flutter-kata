import 'package:app/models/answer.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import 'dart:convert';

class HabitClient {
  final String ENDPOINT_URL = "http://django.twessels.com/habits/api/";

  const HabitClient();



  Future<Answer> createAnswer(Answer answer) async {
    final http.Response response = await http.post(
      ENDPOINT_URL + 'answers/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(answer),
    );

    if (response.statusCode == 201) {
      return Answer.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception("Failed to create an answer!");
    }
  }

  Future<List<Answer>> getAnswers() async {
    var answers = new List<Answer>();

    final http.Response response = await http.get(
      ENDPOINT_URL + 'answers/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Got answers!");
      Map<String, dynamic> map = json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> data = map["results"];
      answers = data.map((model) => Answer.fromJson(model)).toList();
      return answers;
    } else {
      throw Exception("Failed to laod answers!");
    }
  }


  Future<List<Habit>> getHabits() async {
    var habits = new List<Habit>();

    final http.Response response = await http.get(
      ENDPOINT_URL + 'habits/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Got Habits!");

      // UTF-8 deociding must be explicitly done. See https://stackoverflow.com/a/55868078/1370297
      Map<String, dynamic> map = json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> data = map["results"];
      habits = data.map((model) => Habit.fromJson(model)).toList();
      return habits;
    }
    else {
      throw Exception("Failed to load habit");
    }
  }

}

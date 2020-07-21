import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/models.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habits App 2',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Habits Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _stretching = false;
  bool _geige = false;
  bool _gitarre = false;
  bool _jogging = false;
  bool _ergometer = false;
  bool _koerpergewichtsuebungen = false;
  bool _enthaltsamkeit = false;
  bool _lesen = false;


  @override
  void initState() {
    super.initState();
//    var answers = getAnswers();
//    print(answers);
//
//    var habits = getHabits();

  }




  Future<List<Habit>> getHabits() async {
    var habits = new List<Habit>();

    final http.Response response = await http.get(
      'http://django.twessels.com/habits/api/habits/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Got Habits!");
      //Iterable list = json.decode(response.body);
      //answers = list.map((model) => Answer.fromJson(model)).toList();
      //return answers;

      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["results"];
      habits = data.map((model) => Habit.fromJson(model)).toList();
      return habits;

    }
    else {
      Flushbar(
        title:  "Network Error",
        message:  "Could not retrieve answers: ${response.statusCode} ${response.body}",
        duration:  Duration(seconds: 5),
      )..show(context);

      print("Oops! Cannot retrieve answers!");
    }
  }

  Future<List<Answer>> getAnswers() async {
    var answers = new List<Answer>();

    final http.Response response = await http.get(
      'http://django.twessels.com/habits/api/answers/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print("Got answers!");
      //Iterable list = json.decode(response.body);
      //answers = list.map((model) => Answer.fromJson(model)).toList();
      //return answers;

      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["results"];
      answers = data.map((model) => Answer.fromJson(model)).toList();
      return answers;

    }
    else {
      Flushbar(
        title:  "Network Error",
        message:  "Could not retrieve answers: ${response.statusCode} ${response.body}",
        duration:  Duration(seconds: 5),
      )..show(context);

      print("Oops! Cannot retrieve answers!");
    }
  }

  Future<Answer> createAnswer(Answer answer) async {
    //Map<String,String> headers = {'Content-Type':'application/json','authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='};
    final msg = jsonEncode({"created_date":"2020-07-16T16:54:11.876011","duration_in_min":7,"habit":1});

    final http.Response response = await http.post(
      'http://django.twessels.com/habits/api/answers/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(answer),
    );

    if (response.statusCode == 201) {
      print("Successfully created the answer!");
      Flushbar(
        title:  "Created answer!",
        message:  "Submitted ${answer.habit}: ${response.statusCode}",
        duration:  Duration(seconds: 5),
      )..show(context);

      return Answer.fromJson(json.decode(response.body));
    }
    else {

      Flushbar(
        title:  "Network Error",
        message:  "Could not submit answer: ${response.statusCode} ${response.body}",
        duration:  Duration(seconds: 5),
      )..show(context);

      print("Oops! Cannot submit answer!");
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              title: const Text("Stretching"),
              value: _stretching,
              onChanged: (bool value) {
                setState(() {
                  _stretching = value;

                  Answer answer = Answer(
                    created_date: DateTime.now().toIso8601String(),
                    habit: 1,
                    duration_in_min: 7,
                  );

                  createAnswer(answer);

                  });
                },
              secondary: const Icon(Icons.accessibility_new),
            ),
            SwitchListTile(
              title: const Text("Geige"),
              value: _geige,
              onChanged: (bool value) {
                setState(() {
                  _geige = value;

                  Answer answer = Answer(
                    created_date: DateTime.now().toIso8601String(),
                    habit: 2,
                    duration_in_min: 7,
                  );

                  createAnswer(answer);
                });
              },
              secondary: const Icon(Icons.queue_music),
            ),
            SwitchListTile(
              title: const Text("Gitarre"),
              value: _gitarre,
              onChanged: (bool value) {
                setState(() {
                  _gitarre = value;

                  Answer answer = Answer(
                    created_date: DateTime.now().toIso8601String(),
                    habit: 3,
                    duration_in_min: 7,
                  );

                  createAnswer(answer);
                });
              },
              secondary: const Icon(Icons.music_note),
            ),
            SwitchListTile(
              title: const Text("Jogging"),
              value: _jogging,
              onChanged: (bool value) {
                setState(() {
                  _jogging = value;

                  Answer answer = Answer(
                    created_date: DateTime.now().toIso8601String(),
                    habit: 4,
                    duration_in_min: 7,
                  );

                  createAnswer(answer);
                });
              },
              secondary: const Icon(Icons.directions_run),
            ),
            SwitchListTile(
              title: const Text("Ergometer"),
              value: _ergometer,
              onChanged: (bool value) {
                setState(() {
                  _ergometer = value;


                  Answer answer = Answer(
                    created_date: DateTime.now().toIso8601String(),
                    habit: 5,
                    duration_in_min: 7,
                  );

                  createAnswer(answer);
                });
              },
              secondary: const Icon(Icons.accessibility_new),
            ),
            SwitchListTile(
              title: const Text("Körpergewichtsübungen"),
              value: _koerpergewichtsuebungen,
              onChanged: (bool value) {
                setState(() {
                  _koerpergewichtsuebungen = value;


                  Answer answer = Answer(
                    created_date: DateTime.now().toIso8601String(),
                    habit: 6,
                    duration_in_min: 7,
                  );

                  createAnswer(answer);
                });
              },
              secondary: const Icon(Icons.fitness_center),
            ),
            SwitchListTile(
              title: const Text("Enthaltsamkeit"),
              value: _enthaltsamkeit,
              onChanged: (bool value) {
                setState(() {
                  _enthaltsamkeit = value;


                  Answer answer = Answer(
                    created_date: DateTime.now().toIso8601String(),
                    habit: 7,
                    duration_in_min: 7,
                  );

                  createAnswer(answer);
                });
              },
              secondary: const Icon(Icons.favorite),
            ),
            SwitchListTile(
              title: const Text("Lesen"),
              value: _lesen,
              onChanged: (bool value) {
                setState(() {
                  _lesen = value;


                  Answer answer = Answer(
                    created_date: DateTime.now().toIso8601String(),
                    habit: 8,
                    duration_in_min: 7,
                  );

                  createAnswer(answer);
                });
              },
              secondary: const Icon(Icons.book),
            ),
          ],
        ),
      ),

    );
  }
}

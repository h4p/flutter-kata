import 'package:flutter/material.dart';
import 'models/models.dart';
import 'network/habit_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habits App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Habits Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  List<Habit> habits;
  HabitClient httpClient = new HabitClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: habitWidget()

    );
  }

  Widget habitWidget() {
    return FutureBuilder<List<Habit>>(
        future: httpClient.getHabits(),
        builder: (context, AsyncSnapshot<List<Habit>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: _createChildren(snapshot.data)
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }
}

List<Widget> _createChildren(List<Habit> habits) {
  return habits.map((item) => new SwitchListTile(title: new Text(item.name), onChanged: null,value: true)).toList();
}



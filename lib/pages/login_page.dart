import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:namer_app/components/my_button.dart';
import 'package:namer_app/components/my_textfield.dart';

import 'workout_navigator.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();

  final passowrdController = TextEditingController();

  LoginPage({
    super.key,
  });

  void signUserIn(BuildContext context) {
    String jsonString = '''{
  "exercises": [
    {
      "name": "Bench Press",
      "sets": [
        {"reps": 10, "weight": 50},
        {"reps": 8, "weight": 60},
        {"reps": 6, "weight": 70}
      ]
    },
    {
      "name": "Squat",
      "sets": [
        {"reps": 10, "weight": 80},
        {"reps": 8, "weight": 90},
        {"reps": 6, "weight": 100}
      ]
    },
    {
      "name": "Deadlift",
      "sets": [
        {"reps": 5, "weight": 100},
        {"reps": 5, "weight": 120},
        {"reps": 5, "weight": 140}
      ]
    }
  ]
}''';

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    List<dynamic> jsonExercises = jsonMap['exercises'];
    List<Exercise> exercises =
        jsonExercises.map((json) => Exercise.fromJson(json)).toList();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SecondScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(height: 50),
            ClipOval(
                child: Image.asset(
              'lib/assets/fullstack-logo-dalle-2.png',
              width: 100,
              height: 100,
            )),
            const SizedBox(height: 25),
            Text(
              "Welcome to FullStack",
              style: TextStyle(color: Colors.grey[800], fontSize: 16),
            ),
            const SizedBox(height: 25),
            MyTextField(
              controller: usernameController,
              hintText: 'username',
              obscureText: false,
            ),
            const SizedBox(height: 25),
            MyTextField(
              controller: passowrdController,
              hintText: 'password',
              obscureText: true,
            ),
            const SizedBox(height: 25),
            MyButton(
              onTap: () => signUserIn(context),
            ),
            const SizedBox(height: 50),
            Divider(
              thickness: 5,
            )
          ],
        )));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String jsonString = '''{
  "exercises": [
    {
      "name": "Bench Press",
      "sets": [
        {"reps": 10, "weight": 50},
        {"reps": 8, "weight": 60},
        {"reps": 6, "weight": 70}
      ]
    },
    {
      "name": "Squat",
      "sets": [
        {"reps": 10, "weight": 80},
        {"reps": 8, "weight": 90},
        {"reps": 6, "weight": 100}
      ]
    },
    {
      "name": "Deadlift",
      "sets": [
        {"reps": 5, "weight": 100},
        {"reps": 5, "weight": 120},
        {"reps": 5, "weight": 140}
      ]
    }
  ]
}''';

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    List<dynamic> jsonExercises = jsonMap['exercises'];
    List<Exercise> exercises =
        jsonExercises.map((json) => Exercise.fromJson(json)).toList();

    // return Scaffold(
    //   appBar: AppBar(title: Text("Second Screen")),
    //   body: Center(child: Text("Welcome to the second screen!")),

    return Scaffold(
      appBar: AppBar(
        title: Text('FullStack'),
        centerTitle: true,
      ),
      body: ExerciseNavigator(exercises: exercises), // pass in workout instead
    );
  }
}

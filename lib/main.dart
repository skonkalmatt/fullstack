import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  String currentExercise = "";
  int i = 0;

  MyAppState() {
    getNextExercise();
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void getNextExercise() {
    List<String> weightLiftingExercises = [
      'Bench Press',
      'Deadlift',
      'Squat',
      'Overhead Press',
      'Barbell Row',
      'Bicep Curl',
      'Tricep Extension',
      'Leg Press',
      'Pull Up',
      'Dumbbell Fly'
    ];

    if (i == weightLiftingExercises.length) {
      i = 0;
    }
    currentExercise = weightLiftingExercises[i];

    i += 1;
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    // not good to access appState
    // widgets should take only what they need

    var pair = appState.current;
    var exercise = appState.currentExercise;

    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text('Hello Full Stack User'),
          ),

          Text(''),
          BigCard(pair: pair, exercise: exercise),
          // Text('Its time to get to work.'),
          ElevatedButton(
              onPressed: () {
                appState.getNext();
                appState.getNextExercise();
              },
              child: Text('next exercise'))
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
    required this.exercise,
  });

  final WordPair pair;
  final String exercise;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          //child: Text(pair.asUpperCase),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(exercise.toUpperCase()),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Set(),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Set(),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Set(),
        )
      ],
    );
  }
}

class Set extends StatelessWidget {
  const Set({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'weight',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'reps',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'rpe',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

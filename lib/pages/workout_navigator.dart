import 'package:flutter/material.dart';

class ExerciseNavigator extends StatefulWidget {
  final List<Exercise> exercises;

  ExerciseNavigator({Key? key, required this.exercises}) : super(key: key);

  @override
  _ExerciseNavigatorState createState() => _ExerciseNavigatorState();
}

class _ExerciseNavigatorState extends State<ExerciseNavigator> {
  int currentIndex = 0;

  void nextExercise() {
    if (currentIndex < widget.exercises.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void previousExercise() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Exercise currentExercise = widget.exercises[currentIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          currentExercise.name!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        ...currentExercise.sets!.map((set) => Set(
              weight: set.weight,
              reps: set.reps,
            )),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: previousExercise,
                child: Text('Back'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: nextExercise,
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Workout {
  final String? date;
  final String? duration;
  final List<Exercise>? exercises;

  Workout({this.date, this.duration, this.exercises});

  factory Workout.fromJson(Map<String, dynamic> json) {
    var exercisesFromJson = json['exercises'] as List;
    List<Exercise> exerciseList =
        exercisesFromJson.map((i) => Exercise.fromJson(i)).toList();

    return Workout(
      date: json['date'],
      duration: json['duration'],
      exercises: exerciseList,
    );
  }
}

class Exercise {
  final String? name;
  final List<WorkingSet>? sets;

  Exercise({this.name, this.sets});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    var setsFromJson = json['sets'] as List;
    List<WorkingSet> setsList =
        setsFromJson.map((i) => WorkingSet.fromJson(i)).toList();

    return Exercise(
      name: json['name'],
      sets: setsList,
    );
  }
}

class WorkingSet {
  final int? reps;
  final int? weight;

  WorkingSet({this.reps, this.weight});

  factory WorkingSet.fromJson(Map<String, dynamic> json) {
    return WorkingSet(
      reps: json['reps'],
      weight: json['weight'],
    );
  }
}

class Set extends StatelessWidget {
  final int? weight;
  final int? reps;

  const Set({super.key, required this.weight, required this.reps});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: weight.toString(),
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
                hintText: reps.toString(),
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

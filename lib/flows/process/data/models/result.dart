import 'package:equatable/equatable.dart';
import 'package:webspark_test/flows/process/data/models/coordinate.dart';

class Result extends Equatable {
  const Result({
    required this.steps,
    required this.path,
  });

  final List<Coordinate> steps;
  final String path;

  factory Result.from(List<Coordinate> steps) {
    return Result(
      steps: steps,
      path: steps.map((e) => e.toString()).join('->'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'steps': steps.map((e) => e.toMap().toString()),
      'path': path,
    };
  }

  @override
  List<Object?> get props => [steps, path];
}

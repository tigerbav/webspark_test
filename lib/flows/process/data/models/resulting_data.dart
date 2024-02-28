import 'package:equatable/equatable.dart';
import 'package:webspark_test/flows/process/data/models/coordinate.dart';
import 'package:webspark_test/flows/process/data/models/path_finding.dart';
import 'package:webspark_test/flows/process/data/models/result.dart';

class ResultingData extends Equatable {
  const ResultingData({
    required this.id,
    required this.result,
  });

  final String id;
  final Result result;

  factory ResultingData.from(PathFinding pathFinding, List<Coordinate> steps) {
    return ResultingData(id: pathFinding.id, result: Result.from(steps));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'result': result.toMap().toString(),
    };
  }

  @override
  List<Object?> get props => [id, result];
}

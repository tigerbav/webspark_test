import 'package:equatable/equatable.dart';
import 'package:webspark_test/flows/process/data/models/coordinate.dart';

class PathFinding extends Equatable {
  const PathFinding({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  final String id;
  final List<List<String>> field;
  final Coordinate start;
  final Coordinate end;

  factory PathFinding.fromMap(Map<String, dynamic> map) {
    return PathFinding(
      id: map['id'] as String,
      field: _parseArray(map['field']),
      start: Coordinate.fromMap(map['start']),
      end: Coordinate.fromMap(map['end']),
    );
  }

  static List<List<String>> _parseArray(List<dynamic> list) {
    final listInList = list.map((e) => e.split('') as List<String>).toList();
    List<List<String>> field = List.generate(listInList.length, (_) => []);

    try {
      for (final e in listInList) {
        for (var i = 0; i < e.length; i++) {
          field[i].add(e[i]);
        }
      }
    } catch (e) {
      print(e);
    }

    return listInList;
  }

  @override
  List<Object?> get props => [id, field, start, end];
}

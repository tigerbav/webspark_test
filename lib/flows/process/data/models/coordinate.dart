import 'package:equatable/equatable.dart';

class Coordinate extends Equatable {
  const Coordinate({
    required this.x,
    required this.y,
  });

  final int x;
  final int y;

  @override
  String toString() => '($x,$y)';

  Map<String, dynamic> toMap() {
    return {
      'x': '$x',
      'y': '$y',
    };
  }

  factory Coordinate.fromMap(Map<String, dynamic> map) {
    return Coordinate(
      x: map['x'] as int,
      y: map['y'] as int,
    );
  }

  Coordinate copyWith({
    int? x,
    int? y,
  }) {
    return Coordinate(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  List<Object?> get props => [x, y];
}

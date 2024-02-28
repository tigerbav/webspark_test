import 'package:webspark_test/common/app_constants.dart';
import 'package:webspark_test/flows/process/data/models/path_finding.dart';
import 'package:webspark_test/flows/process/data/models/coordinate.dart';
import 'package:webspark_test/flows/process/data/models/resulting_data.dart';
import 'package:webspark_test/services/algorithms/short_way/enums/move_type.dart';

class ShortWay {
  static ResultingData calculate(PathFinding pathFinding) {
    final coordinates = [pathFinding.start];

    final moveType = MoveTypeEx.defineDirection(
      pathFinding.start,
      pathFinding.end,
    );

    _calculate(
      pathFinding: pathFinding,
      coordinates: coordinates,
      currPosition: pathFinding.start,
      moveType: moveType,
    );

    return ResultingData.from(pathFinding, coordinates);
  }

  static void _calculate({
    required PathFinding pathFinding,
    required List<Coordinate> coordinates,
    required Coordinate currPosition,
    required MoveType? moveType,
  }) {
    if (moveType == null || moveType == MoveType.stay) return;

    final newPosition = moveType.direction(
      oldCoordinate: currPosition,
      gridLength: pathFinding.field.length,
    );

    if (newPosition == null ||
        pathFinding.field[newPosition.x][newPosition.y] == C.block ||
        coordinates.contains(newPosition)) {
      return _calculate(
        pathFinding: pathFinding,
        currPosition: currPosition,
        coordinates: coordinates,
        moveType: moveType.counterclockwise,
      );
    } else {
      // move
      coordinates.add(newPosition);
    }

    return _calculate(
      pathFinding: pathFinding,
      coordinates: coordinates,
      currPosition: newPosition,
      moveType: MoveTypeEx.defineDirection(
        newPosition,
        pathFinding.end,
      ),
    );
  }
}

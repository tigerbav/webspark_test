import 'package:webspark_test/common/utils/extensions/int.dart';
import 'package:webspark_test/flows/process/data/models/coordinate.dart';

enum MoveType {
  bottomRight,
  right,
  topRight,
  top,
  topLeft,
  left,
  bottomLeft,
  bottom,
  stay
}

extension MoveTypeEx on MoveType {
  Coordinate? direction({
    required Coordinate oldCoordinate,
    required int gridLength,
  }) {
    late final oldX = oldCoordinate.x;
    late final oldY = oldCoordinate.y;

    if (_noDirection(oldX, oldY, gridLength)) return null;

    switch (this) {
      case MoveType.bottomRight:
        return oldCoordinate.copyWith(x: oldX + 1, y: oldY + 1);
      case MoveType.right:
        return oldCoordinate.copyWith(x: oldX + 1);
      case MoveType.topRight:
        return oldCoordinate.copyWith(x: oldX + 1, y: oldY - 1);
      case MoveType.top:
        return oldCoordinate.copyWith(y: oldY - 1);
      case MoveType.topLeft:
        return oldCoordinate.copyWith(x: oldX - 1, y: oldY - 1);
      case MoveType.left:
        return oldCoordinate.copyWith(x: oldX - 1);
      case MoveType.bottomLeft:
        return oldCoordinate.copyWith(x: oldX - 1, y: oldY + 1);
      case MoveType.bottom:
        return oldCoordinate.copyWith(y: oldY + 1);
      case MoveType.stay:
        return oldCoordinate;
    }
  }

  bool _noDirection(int x, int y, int gridLength) {
    if (x == 0 && _leftMove ||
        gridLength - 1 == x && _rightMove ||
        y == 0 && _topMove ||
        gridLength - 1 == y && _bottomMove) {
      return true;
    }

    return false;
  }

  static MoveType? defineDirection(Coordinate current, Coordinate end) {
    final x = end.x - current.x;
    final y = end.y - current.y;

    final isZeroX = x == 0;
    final isZeroY = y == 0;

    late final isPositiveX = x.isPositive;
    late final isPositiveY = y.isPositive;

    if (isZeroX && isZeroY) {
      return MoveType.stay;
    } //
    else if (isPositiveX && isPositiveY) {
      return MoveType.bottomRight;
    } //
    else if (isPositiveX && isZeroY) {
      return MoveType.right;
    } //
    else if (isPositiveX && isPositiveY == false) {
      return MoveType.topRight;
    } //
    else if (isZeroX && isPositiveY == false) {
      return MoveType.top;
    } //
    else if (isPositiveX == false &&
        isPositiveY == false &&
        isZeroY == false &&
        isZeroX == false) {
      return MoveType.topLeft;
    } //
    else if (isPositiveX == false && isZeroY) {
      return MoveType.left;
    } //
    else if (isPositiveX == false &&
        isPositiveY &&
        isZeroX == false &&
        isZeroY == false) {
      return MoveType.bottomLeft;
    } //
    else if (isZeroX && isPositiveY) {
      return MoveType.bottom;
    }

    return null;
  }

  MoveType get counterclockwise {
    // exclude MoveType.stay
    if (index + 1 >= MoveType.values.length - 1) return MoveType.bottomRight;

    return MoveType.values[index + 1];
  }

  MoveType get clockwise {
    if (index - 1 >= 0) return MoveType.values[index - 1];

    return MoveType.bottom;
  }

  bool get _topMove =>
      this == MoveType.topLeft ||
      this == MoveType.top ||
      this == MoveType.topRight;

  bool get _rightMove =>
      this == MoveType.topRight ||
      this == MoveType.right ||
      this == MoveType.bottomRight;

  bool get _bottomMove =>
      this == MoveType.bottomLeft ||
      this == MoveType.bottom ||
      this == MoveType.bottomRight;

  bool get _leftMove =>
      this == MoveType.bottomLeft ||
      this == MoveType.left ||
      this == MoveType.topLeft;
}

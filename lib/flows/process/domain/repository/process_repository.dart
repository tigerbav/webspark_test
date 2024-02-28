import 'package:either_dart/either.dart';
import 'package:webspark_test/flows/process/data/datasources/process_datasource.dart';
import 'package:webspark_test/flows/process/data/models/path_finding.dart';
import 'package:webspark_test/flows/process/data/models/resulting_data.dart';
import 'package:webspark_test/services/network/failure.dart';

abstract class IProcessRepository {
  Future<Either<Failure, List<PathFinding>>> getPathFinding(String link);
  Future<Either<Failure, List<ResultingData>>> getResultingData(
    List<PathFinding> list,
  );
  Future<Either<Failure, void>> sendResultToServer({
    required String link,
    required List<ResultingData> list,
  });
}

class ProcessRepository extends IProcessRepository {
  final IProcessDataSource _dataSource;
  ProcessRepository(this._dataSource);

  @override
  Future<Either<Failure, List<PathFinding>>> getPathFinding(String link) async {
    try {
      final result = await _dataSource.getPathFinding(link);
      return Right(result);
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }

  @override
  Future<Either<Failure, List<ResultingData>>> getResultingData(
    List<PathFinding> list,
  ) async {
    try {
      final result = await _dataSource.getResultingData(list);
      return Right(result);
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }

  @override
  Future<Either<Failure, void>> sendResultToServer({
    required String link,
    required List<ResultingData> list,
  }) async {
    try {
      await _dataSource.sendResultToServer(
        link: link,
        list: list,
      );
      return const Right({});
    } catch (e, trace) {
      return Left(Failure.from(e, trace));
    }
  }
}

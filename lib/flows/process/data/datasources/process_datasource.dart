import 'package:webspark_test/common/app_constants.dart';
import 'package:webspark_test/flows/process/data/models/path_finding.dart';
import 'package:webspark_test/flows/process/data/models/resulting_data.dart';
import 'package:webspark_test/services/algorithms/short_way/short_way.dart';
import 'package:webspark_test/services/network/api_manager.dart';

abstract class IProcessDataSource {
  Future<List<PathFinding>> getPathFinding(String link);
  Future<List<ResultingData>> getResultingData(List<PathFinding> list);
  Future<void> sendResultToServer({
    required String link,
    required List<ResultingData> list,
  });
}

class ProcessDataSource extends IProcessDataSource {
  @override
  Future<List<PathFinding>> getPathFinding(String link) async {
    try {
      final pathFindingsList = <PathFinding>[];

      final result = await ApiManager.shared.get(link);
      if (result.data[C.error] == true) {
        throw Exception(result.data[C.message]);
      }

      for (final pathFinding in result.data[C.data]) {
        pathFindingsList.add(PathFinding.fromMap(pathFinding));
      }

      return Future.value(pathFindingsList);
    } catch (e) {
      return throw Future.error(e);
    }
  }

  @override
  Future<List<ResultingData>> getResultingData(List<PathFinding> list) {
    final resultingDataList = <ResultingData>[];
    for (final pathFinding in list) {
      resultingDataList.add(ShortWay.calculate(pathFinding));
    }
    return Future.value(resultingDataList);
  }

  @override
  Future<void> sendResultToServer({
    required String link,
    required List<ResultingData> list,
  }) async {
    try {
      await ApiManager.shared.post(
        link,
        list.map((e) => e.toMap()).toList(),
      );
    } catch (e) {
      print(e);
    }
  }
}

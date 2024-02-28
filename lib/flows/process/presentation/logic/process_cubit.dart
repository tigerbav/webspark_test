import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test/flows/process/data/models/path_finding.dart';
import 'package:webspark_test/flows/process/data/models/resulting_data.dart';
import 'package:webspark_test/flows/process/domain/repository/process_repository.dart';

part 'process_state.dart';

class ProcessCubit extends Cubit<ProcessState> {
  ProcessCubit({required this.repository, required this.link})
      : super(const ProcessState(
          status: ProcessStatus.initial,
          resultingData: [],
          pathFinding: [],
        )) {
    _getPartFindings(link);
  }

  final IProcessRepository repository;
  final String link;

  Future<void> _getPartFindings(String link) async {
    emit(state.copyWith(status: ProcessStatus.loading));
    final result = await repository.getPathFinding(link);
    result.fold(
      (l) => emit(state.copyWith(
        status: ProcessStatus.failure,
        errorMessage: l.errorMessage,
      )),
      (r) {
        emit(state.copyWith(
          status: ProcessStatus.loading,
          pathFinding: r,
        ));
        _calculate(r);
      },
    );
  }

  void _calculate(List<PathFinding> pathFindings) async {
    final result = await repository.getResultingData(pathFindings);

    result.fold(
      (l) => emit(state.copyWith(
        status: ProcessStatus.failure,
        errorMessage: l.errorMessage,
      )),
      (r) => emit(state.copyWith(
        status: ProcessStatus.success,
        resultingData: r,
      )),
    );
  }

  void sendResultToServer() async {
    final result = await repository.sendResultToServer(
      link: link,
      list: state._resultingData,
    );

    result.fold(
      (l) => emit(state.copyWith(
        status: ProcessStatus.failure,
        errorMessage: l.errorMessage,
      )),
      (r) => emit(state.copyWith(
        status: ProcessStatus.success,
      )),
    );
  }
}

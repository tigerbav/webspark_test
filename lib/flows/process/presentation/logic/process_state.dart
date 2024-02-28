part of 'process_cubit.dart';

enum ProcessStatus { loading, failure, success, initial, idle }

class ProcessState extends Equatable {
  const ProcessState({
    required this.status,
    required List<ResultingData> resultingData,
    required List<PathFinding> pathFinding,
    this.errorMessage,
  })  : _resultingData = resultingData,
        _pathFinding = pathFinding;

  final ProcessStatus status;
  final String? errorMessage;
  final List<ResultingData> _resultingData;
  final List<PathFinding> _pathFinding;

  List<ResultingData> get resultingData => _resultingData;

  bool get isLoading => status == ProcessStatus.loading;
  bool get isFailure => status == ProcessStatus.failure;

  List<List<String>> field(String id) {
    return _pathFinding.firstWhere((e) => e.id == id).field;
  }

  ProcessState copyWith({
    required ProcessStatus status,
    List<ResultingData>? resultingData,
    List<PathFinding>? pathFinding,
    String? errorMessage,
  }) {
    return ProcessState(
      status: status,
      resultingData: resultingData ?? _resultingData,
      pathFinding: pathFinding ?? _pathFinding,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        _resultingData,
        _pathFinding,
        errorMessage,
      ];
}

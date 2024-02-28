part of 'home_cubit.dart';

enum HomeStatus { initial, success, failure, idle, loading }

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    this.link = AppLinks.link,
    this.errorMessage,
  });

  final HomeStatus status;
  final String link;

  final String? errorMessage;

  HomeState copyWith({
    required HomeStatus status,
    String? link,
    String? errorMessage,
  }) {
    return HomeState(
      status: status,
      link: link ?? this.link,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, link, errorMessage];
}

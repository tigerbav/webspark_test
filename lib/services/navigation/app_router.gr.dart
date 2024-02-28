// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    PreviewRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PreviewScreen(
          key: args.key,
          resultingData: args.resultingData,
          field: args.field,
        ),
      );
    },
    ProcessRoute.name: (routeData) {
      final args = routeData.argsAs<ProcessRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProcessScreen(
          key: args.key,
          link: args.link,
        ),
      );
    },
    ResultListRoute.name: (routeData) {
      final args = routeData.argsAs<ResultListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultListScreen(
          key: args.key,
          state: args.state,
        ),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PreviewScreen]
class PreviewRoute extends PageRouteInfo<PreviewRouteArgs> {
  PreviewRoute({
    Key? key,
    required ResultingData resultingData,
    required List<List<String>> field,
    List<PageRouteInfo>? children,
  }) : super(
          PreviewRoute.name,
          args: PreviewRouteArgs(
            key: key,
            resultingData: resultingData,
            field: field,
          ),
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static const PageInfo<PreviewRouteArgs> page =
      PageInfo<PreviewRouteArgs>(name);
}

class PreviewRouteArgs {
  const PreviewRouteArgs({
    this.key,
    required this.resultingData,
    required this.field,
  });

  final Key? key;

  final ResultingData resultingData;

  final List<List<String>> field;

  @override
  String toString() {
    return 'PreviewRouteArgs{key: $key, resultingData: $resultingData, field: $field}';
  }
}

/// generated route for
/// [ProcessScreen]
class ProcessRoute extends PageRouteInfo<ProcessRouteArgs> {
  ProcessRoute({
    Key? key,
    required String link,
    List<PageRouteInfo>? children,
  }) : super(
          ProcessRoute.name,
          args: ProcessRouteArgs(
            key: key,
            link: link,
          ),
          initialChildren: children,
        );

  static const String name = 'ProcessRoute';

  static const PageInfo<ProcessRouteArgs> page =
      PageInfo<ProcessRouteArgs>(name);
}

class ProcessRouteArgs {
  const ProcessRouteArgs({
    this.key,
    required this.link,
  });

  final Key? key;

  final String link;

  @override
  String toString() {
    return 'ProcessRouteArgs{key: $key, link: $link}';
  }
}

/// generated route for
/// [ResultListScreen]
class ResultListRoute extends PageRouteInfo<ResultListRouteArgs> {
  ResultListRoute({
    Key? key,
    required ProcessState state,
    List<PageRouteInfo>? children,
  }) : super(
          ResultListRoute.name,
          args: ResultListRouteArgs(
            key: key,
            state: state,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultListRoute';

  static const PageInfo<ResultListRouteArgs> page =
      PageInfo<ResultListRouteArgs>(name);
}

class ResultListRouteArgs {
  const ResultListRouteArgs({
    this.key,
    required this.state,
  });

  final Key? key;

  final ProcessState state;

  @override
  String toString() {
    return 'ResultListRouteArgs{key: $key, state: $state}';
  }
}

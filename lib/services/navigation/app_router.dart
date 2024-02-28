import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webspark_test/flows/home/presentation/screens/home_screen.dart';
import 'package:webspark_test/flows/preview/presentation/screens/preview_screen.dart';
import 'package:webspark_test/flows/process/data/models/resulting_data.dart';
import 'package:webspark_test/flows/process/presentation/logic/process_cubit.dart';
import 'package:webspark_test/flows/process/presentation/screens/process_screen.dart';
import 'package:webspark_test/flows/result_list/presentation/screens/result_list_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: HomeRoute.page),
        AutoRoute(page: ProcessRoute.page),
        AutoRoute(page: ResultListRoute.page),
        AutoRoute(page: ResultListRoute.page),
        AutoRoute(page: PreviewRoute.page),
      ];
}

// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "home_screen": "Home screen",
  "set_valid_api": "Set valid API base URL in order to continue",
  "incorrect_link": "Incorrect link.",
  "something_went_wrong": "Something went wrong.",
  "start_counting_process": "Start counting process",
  "process_screen": "Process screen",
  "calculation_has_finished": "All calculations has finished, you can send your results to server",
  "send_results_to_server": "Send results to server",
  "result_list_screen": "Result list screen",
  "preview_screen": "Preview screen"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US};
}

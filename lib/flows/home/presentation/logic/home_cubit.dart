import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test/generated/locale_keys.g.dart';
import 'package:webspark_test/services/network/app_links.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(status: HomeStatus.initial));

  void setLink(String link) {
    emit(state.copyWith(
      status: HomeStatus.idle,
      link: link,
    ));
  }

  void checkLink() async {
    //reset
    emit(state.copyWith(status: HomeStatus.idle));

    final regEx = RegExp(
        '((http|https)://)(www.)?[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)');
    if (regEx.hasMatch(state.link)) {
      emit(state.copyWith(status: HomeStatus.success));
      return;
    }
    emit(state.copyWith(
      status: HomeStatus.failure,
      errorMessage: LocaleKeys.incorrect_link.tr(),
    ));
  }
}

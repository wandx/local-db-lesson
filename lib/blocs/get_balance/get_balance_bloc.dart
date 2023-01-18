import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_db_lesson/current_user.dart';
import 'package:local_db_lesson/repo/balance_repository.dart';

part 'get_balance_event.dart';

part 'get_balance_state.dart';

class GetBalanceBloc extends Bloc<GetBalanceEvent, GetBalanceState> {
  GetBalanceBloc() : super(GetBalanceInitial()) {
    on<GetBalance>((event, emit) async {
      emit(GetBalanceLoading());
      await _repo.getBalance(CurrentUser.instance.user!).then((value) {
        emit(GetBalanceLoaded(value));
      });
    });
  }

  final _repo = BalanceRepository();
}

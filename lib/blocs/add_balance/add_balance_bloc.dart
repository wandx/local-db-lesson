import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:local_db_lesson/current_user.dart';
import 'package:local_db_lesson/repo/balance_repository.dart';

part 'add_balance_event.dart';

part 'add_balance_state.dart';

class AddBalanceBloc extends Bloc<AddBalanceEvent, AddBalanceState> {
  AddBalanceBloc() : super(AddBalanceInitial()) {
    on<AddBalance>((event, emit) async {
      emit(AddBalanceLoading());
      final user = CurrentUser.instance.user!;
      await _repo.add(user, event.amount).then((b) {
        emit(AddBalanceLoaded(b!.amount));
      });
    });
  }

  final _repo = BalanceRepository();
}

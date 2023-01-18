import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_db_lesson/current_user.dart';
import 'package:local_db_lesson/models/balance.dart';
import 'package:local_db_lesson/models/user.dart';
import 'package:local_db_lesson/repo/transfer_repository.dart';

import '../../models/transfer.dart';

part 'send_money_event.dart';

part 'send_money_state.dart';

class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  SendMoneyBloc() : super(SendMoneyInitial()) {
    on<SendMoney>((event, emit) async {
      emit(SendMoneyLoading());
      await _repo
          .send(
        CurrentUser.instance.user!,
        event.destination,
        event.amount,
      )
          .then((value) {
        emit(SendMoneySuccess(value!));
      }).onError((error, stackTrace) {
        emit(SendMoneyFailed());
      });
    });
  }

  final _repo = TransferRepository();
}

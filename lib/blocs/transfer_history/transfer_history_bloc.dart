import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_db_lesson/current_user.dart';
import 'package:local_db_lesson/models/transfer.dart';
import 'package:local_db_lesson/repo/transfer_repository.dart';

part 'transfer_history_event.dart';

part 'transfer_history_state.dart';

class TransferHistoryBloc
    extends Bloc<TransferHistoryEvent, TransferHistoryState> {
  TransferHistoryBloc() : super(TransferHistoryInitial()) {
    on<GetTransferHistory>((event, emit) async {
      emit(TransferHistoryLoading());
      await _repo.history(CurrentUser.instance.user!).then((value) {
        emit(TransferHistoryLoaded(value));
      }).onError((error, stackTrace) {
        emit(TransferHistoryLoaded([]));
      });
    });
  }

  final _repo = TransferRepository();
}

part of 'transfer_history_bloc.dart';

abstract class TransferHistoryEvent extends Equatable {
  const TransferHistoryEvent();
}

class GetTransferHistory extends TransferHistoryEvent {
  @override
  List<Object?> get props => [];
}

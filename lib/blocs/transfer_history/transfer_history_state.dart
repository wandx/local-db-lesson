part of 'transfer_history_bloc.dart';

abstract class TransferHistoryState extends Equatable {
  const TransferHistoryState();
}

class TransferHistoryInitial extends TransferHistoryState {
  @override
  List<Object> get props => [];
}

class TransferHistoryLoading extends TransferHistoryState {
  @override
  List<Object> get props => [];
}

class TransferHistoryLoaded extends TransferHistoryState {
  final List<Transfer> transfers;

  TransferHistoryLoaded(this.transfers);

  @override
  List<Object> get props => [transfers];
}

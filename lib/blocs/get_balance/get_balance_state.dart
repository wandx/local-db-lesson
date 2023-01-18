part of 'get_balance_bloc.dart';

abstract class GetBalanceState extends Equatable {
  const GetBalanceState();
}

class GetBalanceInitial extends GetBalanceState {
  @override
  List<Object> get props => [];
}

class GetBalanceLoading extends GetBalanceState {
  @override
  List<Object> get props => [];
}

class GetBalanceLoaded extends GetBalanceState {
  final int balance;

  GetBalanceLoaded(this.balance);

  @override
  List<Object> get props => [balance];
}

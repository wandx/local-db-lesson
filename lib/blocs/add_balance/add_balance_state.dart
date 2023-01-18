part of 'add_balance_bloc.dart';

abstract class AddBalanceState extends Equatable {
  const AddBalanceState();
}

class AddBalanceInitial extends AddBalanceState {
  @override
  List<Object> get props => [];
}

class AddBalanceLoading extends AddBalanceState {
  @override
  List<Object> get props => [];
}

class AddBalanceLoaded extends AddBalanceState {
  final int balance;

  AddBalanceLoaded(this.balance);

  @override
  List<Object> get props => [balance];
}

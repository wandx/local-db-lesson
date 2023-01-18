part of 'add_balance_bloc.dart';

abstract class AddBalanceEvent extends Equatable {
  const AddBalanceEvent();
}

class AddBalance extends AddBalanceEvent {
  final int amount;

  AddBalance(this.amount);

  @override
  List<Object?> get props => [amount];
}

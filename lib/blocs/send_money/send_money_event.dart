part of 'send_money_bloc.dart';

abstract class SendMoneyEvent extends Equatable {
  const SendMoneyEvent();
}


class SendMoney extends SendMoneyEvent{
  final User destination;
  final int amount;

  SendMoney(this.destination, this.amount);

  @override
  List<Object?> get props => [destination,amount];
}
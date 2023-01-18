part of 'send_money_bloc.dart';

abstract class SendMoneyState extends Equatable {
  const SendMoneyState();
}

class SendMoneyInitial extends SendMoneyState {
  @override
  List<Object> get props => [];
}

class SendMoneyLoading extends SendMoneyState {
  @override
  List<Object> get props => [];
}

class SendMoneySuccess extends SendMoneyState {
  final Transfer transfer;

  SendMoneySuccess(this.transfer);

  @override
  List<Object> get props => [transfer];
}

class SendMoneyFailed extends SendMoneyState {
  @override
  List<Object> get props => [];
}

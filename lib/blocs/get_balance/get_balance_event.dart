part of 'get_balance_bloc.dart';

abstract class GetBalanceEvent extends Equatable {
  const GetBalanceEvent();
}

class GetBalance extends GetBalanceEvent{
  @override
  List<Object?> get props => [];

}
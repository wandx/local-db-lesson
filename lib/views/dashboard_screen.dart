import 'package:flutter/material.dart';
import 'package:local_db_lesson/blocs/add_balance/add_balance_bloc.dart';
import 'package:local_db_lesson/blocs/send_money/send_money_bloc.dart';
import 'package:local_db_lesson/blocs/transfer_history/transfer_history_bloc.dart';
import 'package:local_db_lesson/current_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_db_lesson/models/user.dart';

import '../blocs/get_balance/get_balance_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DashboardView();
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo, ${CurrentUser.instance.user!.name}'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<AddBalanceBloc>().add(AddBalance(100000));
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<SendMoneyBloc>().add(
                    SendMoney(
                      User(id: 2, name: 'Soni', accountNumber: '11111'),
                      25000,
                    ),
                  );

              /// scren A
              // final pin = await Navigator.push(context, pinscreen);
              //
              // if(pin is bool && pin){
              //   giworghrwgh
              // }else{
              //
              // }

              /// screen pin
              // Navigator.pop(context,true);
              // Navigator.pop(context,false);
            },
            child: Icon(Icons.send),
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AddBalanceBloc, AddBalanceState>(
            listener: (context, state) {
              if (state is AddBalanceLoaded) {
                context.read<GetBalanceBloc>().add(GetBalance());
              }
            },
          ),
          BlocListener<SendMoneyBloc, SendMoneyState>(
            listener: (context, state) {
              if (state is SendMoneySuccess) {
                context
                    .read<AddBalanceBloc>()
                    .add(AddBalance(state.transfer.amount * -1));
                context.read<TransferHistoryBloc>().add(GetTransferHistory());
              }
            },
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Balance',
              textAlign: TextAlign.center,
            ),
            Text(
              'Rp ${context.select((GetBalanceBloc bloc) {
                final state = bloc.state;
                if (state is GetBalanceLoaded) {
                  return state.balance;
                } else {
                  return 0;
                }
              })}',
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: BlocBuilder<TransferHistoryBloc, TransferHistoryState>(
                builder: (context, state) {
                  if (state is TransferHistoryLoaded) {
                    if (state.transfers.isEmpty) {
                      return Center(
                        child: Text('No Transfer'),
                      );
                    }

                    return SingleChildScrollView(
                      child: Column(
                        children: state.transfers
                            .map((e) => Container(
                                  child: Column(
                                    children: [
                                      Text('${e.source} -> ${e.destination}'),
                                      Text(e.amount.toString()),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

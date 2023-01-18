import 'dart:math';

import 'package:hive/hive.dart';
import 'package:local_db_lesson/models/balance.dart';
import 'package:local_db_lesson/models/user.dart';

class BalanceRepository {
  Future<int> getBalance(User user) async {
    try {
      const boxName = 'balances';
      late Box<Balance> box;

      if (!Hive.isBoxOpen(boxName)) {
        box = await Hive.openBox(boxName);
      } else {
        box = Hive.box(boxName);
      }

      return box.values
          .where((element) => element.user == user.accountNumber)
          .fold(
        0,
        (previousValue, element) async {
          return await previousValue + element.amount;
        },
      );
    } catch (e) {
      return 0;
    }
  }

  Future<Balance?> add(
    User user,
    int amount, {
    String description = '',
  }) async {
    try {
      const boxName = 'balances';
      late Box<Balance> box;

      if (!Hive.isBoxOpen(boxName)) {
        box = await Hive.openBox(boxName);
      } else {
        box = Hive.box(boxName);
      }

      final b = Balance(
        id: generateRandomString(10),
        amount: amount,
        user: user.accountNumber,
        description: description,
      );

      box.add(b);
      return b;
    } catch (e) {
      return null;
    }
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
}

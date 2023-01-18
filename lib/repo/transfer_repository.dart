import 'package:hive/hive.dart';
import 'package:local_db_lesson/current_user.dart';
import 'package:local_db_lesson/models/transfer.dart';
import 'package:local_db_lesson/models/user.dart';

class TransferRepository {
  Future<Transfer?> send(User source, User dest, int amount) async {
    try {
      const boxName = 'transfers';
      late Box<Transfer> box;

      if (!Hive.isBoxOpen(boxName)) {
        box = await Hive.openBox(boxName);
      } else {
        box = Hive.box(boxName);
      }

      final tf = Transfer(
        source: source.accountNumber,
        destination: dest.accountNumber,
        amount: amount,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      box.add(tf);
      return tf;
    } catch (e) {
      return null;
    }
  }

  Future<List<Transfer>> history(User user) async {
    try {
      const boxName = 'transfers';
      late Box<Transfer> box;

      if (!Hive.isBoxOpen(boxName)) {
        box = await Hive.openBox(boxName);
      } else {
        box = Hive.box(boxName);
      }

      final transfers = box.values
          .where((e) =>
              e.source.contains(user.accountNumber) ||
              e.destination.contains(user.accountNumber))
          .map((e) => e)
          .toList();
      return transfers;
    } catch (e) {
      return [];
    }
  }
}

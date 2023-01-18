import 'package:hive/hive.dart';
import 'package:local_db_lesson/constants/hive_box_type.dart';

part 'balance.g.dart';

@HiveType(typeId: HiveBoxType.balance)
class Balance {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int amount;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String user;

  Balance({
    required this.id,
    required this.amount,
    this.description = '',
    required this.user,
  });
}

import 'package:hive/hive.dart';
import 'package:local_db_lesson/constants/hive_box_type.dart';

part 'transfer.g.dart';

@HiveType(typeId: HiveBoxType.transfer)
class Transfer {
  @HiveField(0)
  final String source;
  @HiveField(1)
  final String destination;
  @HiveField(2)
  final int amount;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final int createdAt;

  Transfer({
    required this.source,
    required this.destination,
    required this.amount,
    this.description = '',
    required this.createdAt,
  });
}

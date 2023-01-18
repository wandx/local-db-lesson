// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransferAdapter extends TypeAdapter<Transfer> {
  @override
  final int typeId = 0;

  @override
  Transfer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transfer(
      source: fields[0] as String,
      destination: fields[1] as String,
      amount: fields[2] as int,
      description: fields[3] as String,
      createdAt: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Transfer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.destination)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransferAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

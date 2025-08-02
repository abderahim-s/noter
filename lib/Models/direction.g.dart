// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DirectionAdapter extends TypeAdapter<Direction> {
  @override
  final int typeId = 1;

  @override
  Direction read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Direction.non;
      case 1:
        return Direction.grid;
      case 2:
        return Direction.column;
      default:
        return Direction.non;
    }
  }

  @override
  void write(BinaryWriter writer, Direction obj) {
    switch (obj) {
      case Direction.non:
        writer.writeByte(0);
        break;
      case Direction.grid:
        writer.writeByte(1);
        break;
      case Direction.column:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DirectionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_store_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StopStoreObjectAdapter extends TypeAdapter<StopStoreObject> {
  @override
  final int typeId = 1;

  @override
  StopStoreObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StopStoreObject(
      fields[0] as String,
      fields[2] as String,
      uses: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StopStoreObject obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.uses)
      ..writeByte(2)
      ..write(obj.stopJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StopStoreObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

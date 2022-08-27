// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubTaskModelAdapter extends TypeAdapter<SubTaskModel> {
  @override
  final int typeId = 3;

  @override
  SubTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubTaskModel(
      subTask: fields[0] as String,
      isDone: fields[1] as bool,
      isDelete: fields[2] as bool,
      idSubTask: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, SubTaskModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.subTask)
      ..writeByte(1)
      ..write(obj.isDone)
      ..writeByte(2)
      ..write(obj.isDelete)
      ..writeByte(3)
      ..write(obj.idSubTask);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

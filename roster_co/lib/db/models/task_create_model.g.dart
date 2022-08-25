// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_create_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreateTaskModelAdapter extends TypeAdapter<CreateTaskModel> {
  @override
  final int typeId = 2;

  @override
  CreateTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreateTaskModel(
      idTask: fields[0] as int?,
      title: fields[1] as String,
      date: fields[2] as String,
      priority: fields[3] as String,
      description: fields[4] as String,
      time: fields[5] as String,
      snooze: fields[6] as int,
      subTask: fields[7] as SubTaskModel,
      category: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CreateTaskModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.idTask)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.priority)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.snooze)
      ..writeByte(7)
      ..write(obj.subTask)
      ..writeByte(8)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

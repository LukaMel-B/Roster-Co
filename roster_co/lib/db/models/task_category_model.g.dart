// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskCategoryModelAdapter extends TypeAdapter<TaskCategoryModel> {
  @override
  final int typeId = 1;

  @override
  TaskCategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskCategoryModel(
      idCategory: fields[0] as int?,
      icon: fields[2] as int,
      title: fields[1] as String,
      description: fields[3] as String,
      bgColor: fields[4] as int,
      iconColor: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TaskCategoryModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.idCategory)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.bgColor)
      ..writeByte(5)
      ..write(obj.iconColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskCategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

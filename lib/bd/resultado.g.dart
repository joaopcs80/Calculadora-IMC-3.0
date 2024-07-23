// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultado.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultadoAdapter extends TypeAdapter<Resultado> {
  @override
  final int typeId = 0;

  @override
  Resultado read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Resultado(
      nome: fields[0] as String,
      imc: fields[1] as double,
      classificacao: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Resultado obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.imc)
      ..writeByte(2)
      ..write(obj.classificacao);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultadoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
